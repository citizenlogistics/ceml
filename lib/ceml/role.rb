module CEML
  class Role < Struct.new :name, :criteria, :range, :casted
    # def <=>(b); b.criteria.complexity <=> criteria.complexity; end
    def affinity candidate, star
      return [-1, -1, -1 ] unless fits?(candidate, star)
      [ criteria.complexity, -needed, -allowed ]
    end

    def filled?;   needed == 0; end
    def one_left?; needed == 1; end

    def rm(*ids); casted.delete_if{ |guy| ids.include? guy[:id] }; end
    def needed; [range.min - casted.size, 0].max; end
    def allowed; [range.max - casted.size, 0].max; end

    def fits?(candidate, star = nil)
      return false unless criteria =~ candidate
      return false if casted.size >= range.max
      return false if casted.any?{ |guy| guy[:id] == candidate[:id] }
      return true unless star
      c = criteria
      if c.matching
        return unless c.matching.all?{ |g| candidate[:matchables][g] == star[:matchables][g] }
      end
      if c.radius
        c_ll = Geokit::LatLng(candidate[:lat], candidate[:lng])
        s_ll = Geokit::LatLng(star[:lat], star[:lng])
        return unless c_ll.distance_to(s_ll, :meters) <= c.radius
      end
      if c.timewindow
        return unless star.ts - candidate.ts <= c.timewindow
      end
      return true
    end
  end
end
