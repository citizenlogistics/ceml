require 'set'

module Kernel
  def gen_code(size = 8)
    rand(36**size).to_s(36)
  end
end

module CEML
  class Driver

    PLAYERS   = {}
    INCIDENTS = {}
    def with_incident(id, script = nil, metadata = {})
      id ||= rand(36**10).to_s(36)
      PLAYERS[id] ||= []
      INCIDENTS[id] ||= CEML::Incident.new to_bytecode(script), id if script
      raise "no incident #{id}" unless INCIDENTS[id]
      yield INCIDENTS[id], PLAYERS[id], metadata if block_given?
      id
    end
    alias_method :start, :with_incident

    def to_bytecode bytecode_or_script
      case bytecode_or_script
      when String;       return CEML.parse(:script, bytecode_or_script).bytecode
      when CEML::Script; return bytecode_or_script.bytecode
      when Array;        return bytecode_or_script
      else return nil
      end
    end

    def log(s)
      # puts s
    end

    SCRIPTS = Hash.new{ |h,k| h[k] = [] }
    def add_script script_collection_id, script
      SCRIPTS[script_collection_id] << script
    end

    def ping_all script_collection_id, candidate
      SCRIPTS[script_collection_id].each{ |s| ping script_collection_id, s.roles_to_cast, candidate }
    end

    def launch script_collection_id, roleset, *cast
      script = SCRIPTS[script_collection_id].select{ |s| s.roles_to_cast == roleset }.sort_by{ rand }.first
      unless script
        rolesets = SCRIPTS[script_collection_id].map(&:roles_to_cast)
        raise "matching roleset not found: #{roleset.inspect} in #{rolesets.inspect}"
      end
      push nil, script.bytecode, *cast
    end


    LOCATIONS = Hash.new{ |h,k| h[k] = [] }
    def ping script_collection_id, roleset, candidate
      return unless roleset.any?{ |r| r.fits? candidate }
      candidate[:ts] = CEML.clock
      script_id = roleset.hash

      locs = LOCATIONS[script_id].group_by{ |l| l.stage_with_candidate(candidate) }
      if locs[:joinable]
        log "joining..."
        first = locs[:joinable].shift
        first.push candidate
        push first.incident_id, nil, candidate     # JOIN THEM

      elsif locs[:launchable]
        log "launching..."
        first = locs[:launchable].shift
        first.push candidate
        cast = first.cast
        launch script_collection_id, roleset, *cast
        (locs[:launchable] + (locs[:listable]||[])).each{ |l| l.rm *cast }

      elsif locs[:listable]
        log "listing..."
        locs[:listable].each{ |l| l.push candidate }

      else
        c = Confluence.new(roleset)
        case c.stage_with_candidate(candidate)
        when :launchable
          log "start-launching..."
          c.push candidate
          launch script_collection_id, roleset, candidate
        when :listable
          log "start-listing..."
          c.push candidate
          LOCATIONS[script_id] << c
        else raise "what?"
        end

      end

      LOCATIONS[script_id].delete_if(&:full?)
      # save the changed ones and clear dirty flag
    end

    def push incident_id, script, *updated_players
      with_incident incident_id, script do |incident, players, metadata|
        subpost incident, players, metadata, *updated_players
      end
    end

    def post incident_id, *updated_players
      push incident_id, nil, *updated_players
    end

    alias_method :run, :post

    def subpost incident, players, metadata, *updated_players
      updated_players.each do |player|
        player_id = player[:id]
        player[:roles] = Set.new([*player[:roles] || []])
        player[:roles] << :agents << :players << :both << :all << :each << :everyone
        if existing_player = players.find{ |p| p[:id] == player_id }
          existing_player[:roles] += player.delete :roles
          existing_player.update player
        else
          players << player
        end
      end
      incident.run(players) do |player, meth, what|
        meth = "player_#{meth}"
        log "[#{incident.id}] #{meth}: #{player[:id]} #{what.inspect}"
        if respond_to? meth
          metadata.update :player => player, :players => players, :id => incident.id
          result = send(meth, metadata, what)
          metadata.delete :player
          metadata.delete :players
          result
        end
      end
    end

    JUST_SAID = {}
    def player_said(data, what)
      JUST_SAID[data[:player][:id]] = what
      puts "Said #{what.inspect}"
    end
  end
end
