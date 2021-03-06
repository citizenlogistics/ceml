class Hash
  def like(*syms)
    syms.inject({}) { |h, k| h[k] = self[k] if self[k]; h }
  end
end

module CEML
  PLAYER_THREAD_FIELDS = [ :pc, :continue_at, :synced ]
  # :received, :recognized, :last_answer, :last_answer_recognized

  class IncidentModel < Struct.new(:id)
    include Redis::Objects
    lock :running
    value :bytecode,        :marshal => true
    value :data,            :marshal => true
    hash_key :player_roles, :marshal => true

    def add_castings(castings)
      castings.each do |rolename, folks|
        folks.each do |player|
          Player.new(player[:id]).touch(id)
          player_roles[player[:id]] = [rolename.to_sym]
          CEML.log 3, "#{player[:id]}: added as #{rolename.to_sym} ##{id}"
        end
      end
    end

    def release(player_id)
      CEML.log 3, "#{player_id}: releasing from ##{id}"
      Player.new(player_id).clear_incident(id)
      player_roles.delete(player_id)
    end

    def expire
      # TODO: remove casting calls from waiting rooms
      bytecode.clear
      data.clear
    end

    def self.run_latest(cb_obj)
      t = CEML.clock - 1
      ids = redis.zrangebyscore 'ceml_continue_at', 0, t
      ids.each{ |id| self.new(id).run(cb_obj) }
      redis.zremrangebyscore 'ceml_continue_at', 0, t
    end

    def run(cb_obj)
      raise unless String === id
      # puts "RUNNING(#{id})"
      # running_lock.lock do
        metadata, player_data = *data.value
        metadata    ||= { :id => id }
        player_data ||= {}
        players = []

        CEML.log 3, "##{id} #{player_roles.all.inspect}"
        player_roles.each do |player_id, roles|
          player = { :id => player_id, :roles => Set.new(roles) }
          player.merge! player_data[player_id] if player_data[player_id]
          p = Player.new(player_id)
          stored_player = p.data.value
          PLAYER_THREAD_FIELDS.each{ |x| stored_player.delete x }
          msg = p.message.value
          player.merge! msg if msg
          player.merge! stored_player if stored_player
          players << player
        end

        CEML::Incident.new(bytecode.value, id).run(players) do |player, meth, what|
          case meth.to_sym when :released, :finish, :replace
            release(player[:id])
          end
          meth = "player_#{meth}"
          # cb_obj.log "[#{id}] #{meth}: #{player[:id]} #{what.inspect}"
          if cb_obj.respond_to? meth
            metadata.update :player => player, :players => players, :id => id
            result = cb_obj.send(meth, metadata, what)
            metadata.delete :player
            metadata.delete :players
            result
          end
        end

        players.each do |p|
          Player.new(p[:id]).message.value = p.like(:received, :recognized, :situation)
          player_data[p[:id]] = p.like *PLAYER_THREAD_FIELDS
          # PLAYER_THREAD_FIELDS.each{ |x| p.delete x }
        end
        # CEML.log 1, "Player data saving: #{player_data.inspect}"
        data.value = [metadata, player_data]

        if next_run = players.map{ |p| p[:continue_at] }.compact.min
          redis.zadd 'ceml_continue_at', next_run, id
        end
      # end
    end

  end
end
