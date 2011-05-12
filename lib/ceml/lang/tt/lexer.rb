# Autogenerated from a Treetop grammar. Edits may be lost.


module CEML
module Lexer
  include Treetop::Runtime

  def root
    @root ||= :text
  end

  module Text0
  end

  def _nt_text
    start_index = index
    if node_cache[:text].has_key?(index)
      cached = node_cache[:text][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      i1, s1 = index, []
      i2 = index
      r3 = _nt_eol
      if r3
        r2 = nil
      else
        @index = i2
        r2 = instantiate_node(SyntaxNode,input, index...index)
      end
      s1 << r2
      if r2
        if index < input_length
          r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure("any character")
          r4 = nil
        end
        s1 << r4
      end
      if s1.last
        r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
        r1.extend(Text0)
      else
        @index = i1
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      @index = i0
      r0 = nil
    else
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
    end

    node_cache[:text][start_index] = r0

    r0
  end

  module Nl0
    def eol
      elements[2]
    end
  end

  def _nt_nl
    start_index = index
    if node_cache[:nl].has_key?(index)
      cached = node_cache[:nl][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      i1, s1 = index, []
      r3 = _nt_ws
      if r3
        r2 = r3
      else
        r2 = instantiate_node(SyntaxNode,input, index...index)
      end
      s1 << r2
      if r2
        r5 = _nt_comment
        if r5
          r4 = r5
        else
          r4 = instantiate_node(SyntaxNode,input, index...index)
        end
        s1 << r4
        if r4
          r6 = _nt_eol
          s1 << r6
        end
      end
      if s1.last
        r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
        r1.extend(Nl0)
      else
        @index = i1
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      @index = i0
      r0 = nil
    else
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
    end

    node_cache[:nl][start_index] = r0

    r0
  end

  def _nt_ws
    start_index = index
    if node_cache[:ws].has_key?(index)
      cached = node_cache[:ws][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      if has_terminal?('\G[ \\t\\f]', true, index)
        r1 = true
        @index += 1
      else
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      @index = i0
      r0 = nil
    else
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
    end

    node_cache[:ws][start_index] = r0

    r0
  end

  module Comment0
    def text
      elements[1]
    end
  end

  def _nt_comment
    start_index = index
    if node_cache[:comment].has_key?(index)
      cached = node_cache[:comment][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    if has_terminal?('//', false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 2))
      @index += 2
    else
      terminal_parse_failure('//')
      r1 = nil
    end
    s0 << r1
    if r1
      r2 = _nt_text
      s0 << r2
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Comment0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:comment][start_index] = r0

    r0
  end

  module Eol0
  end

  def _nt_eol
    start_index = index
    if node_cache[:eol].has_key?(index)
      cached = node_cache[:eol][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    i1, s1 = index, []
    if has_terminal?("\r", false, index)
      r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure("\r")
      r2 = nil
    end
    s1 << r2
    if r2
      if has_terminal?("\n", false, index)
        r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure("\n")
        r4 = nil
      end
      if r4
        r3 = r4
      else
        r3 = instantiate_node(SyntaxNode,input, index...index)
      end
      s1 << r3
    end
    if s1.last
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
      r1.extend(Eol0)
    else
      @index = i1
      r1 = nil
    end
    if r1
      r0 = r1
    else
      if has_terminal?("\n", false, index)
        r5 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure("\n")
        r5 = nil
      end
      if r5
        r0 = r5
      else
        @index = i0
        r0 = nil
      end
    end

    node_cache[:eol][start_index] = r0

    r0
  end

  module Number0
  end

  module Number1
    def value
      text_value.to_i
    end
  end

  def _nt_number
    start_index = index
    if node_cache[:number].has_key?(index)
      cached = node_cache[:number][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    i1, s1 = index, []
    s2, i2 = [], index
    loop do
      if has_terminal?('\G[1-9]', true, index)
        r3 = true
        @index += 1
      else
        r3 = nil
      end
      if r3
        s2 << r3
      else
        break
      end
    end
    if s2.empty?
      @index = i2
      r2 = nil
    else
      r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
    end
    s1 << r2
    if r2
      s4, i4 = [], index
      loop do
        if has_terminal?('\G[0-9]', true, index)
          r5 = true
          @index += 1
        else
          r5 = nil
        end
        if r5
          s4 << r5
        else
          break
        end
      end
      r4 = instantiate_node(SyntaxNode,input, i4...index, s4)
      s1 << r4
    end
    if s1.last
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
      r1.extend(Number0)
    else
      @index = i1
      r1 = nil
    end
    if r1
      r0 = r1
      r0.extend(Number1)
    else
      if has_terminal?('0', false, index)
        r6 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure('0')
        r6 = nil
      end
      if r6
        r0 = r6
        r0.extend(Number1)
      else
        @index = i0
        r0 = nil
      end
    end

    node_cache[:number][start_index] = r0

    r0
  end

  module And0
  end

  module And1
    def ws1
      elements[1]
    end

    def ws2
      elements[3]
    end
  end

  module And2
  end

  def _nt_and
    start_index = index
    if node_cache[:and].has_key?(index)
      cached = node_cache[:and][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    i1, s1 = index, []
    i3, s3 = index, []
    r5 = _nt_ws
    if r5
      r4 = r5
    else
      r4 = instantiate_node(SyntaxNode,input, index...index)
    end
    s3 << r4
    if r4
      if has_terminal?(',', false, index)
        r6 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure(',')
        r6 = nil
      end
      s3 << r6
    end
    if s3.last
      r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
      r3.extend(And0)
    else
      @index = i3
      r3 = nil
    end
    if r3
      r2 = r3
    else
      r2 = instantiate_node(SyntaxNode,input, index...index)
    end
    s1 << r2
    if r2
      r7 = _nt_ws
      s1 << r7
      if r7
        if has_terminal?('and', false, index)
          r8 = instantiate_node(SyntaxNode,input, index...(index + 3))
          @index += 3
        else
          terminal_parse_failure('and')
          r8 = nil
        end
        s1 << r8
        if r8
          r9 = _nt_ws
          s1 << r9
        end
      end
    end
    if s1.last
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
      r1.extend(And1)
    else
      @index = i1
      r1 = nil
    end
    if r1
      r0 = r1
    else
      i10, s10 = index, []
      r12 = _nt_ws
      if r12
        r11 = r12
      else
        r11 = instantiate_node(SyntaxNode,input, index...index)
      end
      s10 << r11
      if r11
        if has_terminal?(',', false, index)
          r13 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure(',')
          r13 = nil
        end
        s10 << r13
        if r13
          r15 = _nt_ws
          if r15
            r14 = r15
          else
            r14 = instantiate_node(SyntaxNode,input, index...index)
          end
          s10 << r14
        end
      end
      if s10.last
        r10 = instantiate_node(SyntaxNode,input, i10...index, s10)
        r10.extend(And2)
      else
        @index = i10
        r10 = nil
      end
      if r10
        r0 = r10
      else
        @index = i0
        r0 = nil
      end
    end

    node_cache[:and][start_index] = r0

    r0
  end

  def _nt_reserved_word
    start_index = index
    if node_cache[:reserved_word].has_key?(index)
      cached = node_cache[:reserved_word][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    if has_terminal?('and', false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 3))
      @index += 3
    else
      terminal_parse_failure('and')
      r1 = nil
    end
    if r1
      r0 = r1
    else
      if has_terminal?('within', false, index)
        r2 = instantiate_node(SyntaxNode,input, index...(index + 6))
        @index += 6
      else
        terminal_parse_failure('within')
        r2 = nil
      end
      if r2
        r0 = r2
      else
        if has_terminal?('over', false, index)
          r3 = instantiate_node(SyntaxNode,input, index...(index + 4))
          @index += 4
        else
          terminal_parse_failure('over')
          r3 = nil
        end
        if r3
          r0 = r3
        else
          @index = i0
          r0 = nil
        end
      end
    end

    node_cache[:reserved_word][start_index] = r0

    r0
  end

  module Id0
    def reserved_word
      elements[0]
    end

    def ws
      elements[1]
    end
  end

  module Id1
  end

  def _nt_id
    start_index = index
    if node_cache[:id].has_key?(index)
      cached = node_cache[:id][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    i1 = index
    i2, s2 = index, []
    r3 = _nt_reserved_word
    s2 << r3
    if r3
      r4 = _nt_ws
      s2 << r4
    end
    if s2.last
      r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      r2.extend(Id0)
    else
      @index = i2
      r2 = nil
    end
    if r2
      r1 = nil
    else
      @index = i1
      r1 = instantiate_node(SyntaxNode,input, index...index)
    end
    s0 << r1
    if r1
      if has_terminal?('\G[a-zA-Z_]', true, index)
        r5 = true
        @index += 1
      else
        r5 = nil
      end
      s0 << r5
      if r5
        s6, i6 = [], index
        loop do
          if has_terminal?('\G[a-zA-Z_0-9=]', true, index)
            r7 = true
            @index += 1
          else
            r7 = nil
          end
          if r7
            s6 << r7
          else
            break
          end
        end
        r6 = instantiate_node(SyntaxNode,input, i6...index, s6)
        s0 << r6
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Id1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:id][start_index] = r0

    r0
  end

  module Duration0
    def number
      elements[0]
    end

    def time_unit
      elements[2]
    end
  end

  module Duration1
    def seconds
        number.text_value.to_f * case time_unit.text_value
        when /^h/; 60*60; when /^mi/; 60; else 1; end
    end
  end

  def _nt_duration
    start_index = index
    if node_cache[:duration].has_key?(index)
      cached = node_cache[:duration][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_number
    s0 << r1
    if r1
      r3 = _nt_ws
      if r3
        r2 = r3
      else
        r2 = instantiate_node(SyntaxNode,input, index...index)
      end
      s0 << r2
      if r2
        i4 = index
        if has_terminal?('seconds', false, index)
          r5 = instantiate_node(SyntaxNode,input, index...(index + 7))
          @index += 7
        else
          terminal_parse_failure('seconds')
          r5 = nil
        end
        if r5
          r4 = r5
        else
          if has_terminal?('second', false, index)
            r6 = instantiate_node(SyntaxNode,input, index...(index + 6))
            @index += 6
          else
            terminal_parse_failure('second')
            r6 = nil
          end
          if r6
            r4 = r6
          else
            if has_terminal?('s', false, index)
              r7 = instantiate_node(SyntaxNode,input, index...(index + 1))
              @index += 1
            else
              terminal_parse_failure('s')
              r7 = nil
            end
            if r7
              r4 = r7
            else
              if has_terminal?('minutes', false, index)
                r8 = instantiate_node(SyntaxNode,input, index...(index + 7))
                @index += 7
              else
                terminal_parse_failure('minutes')
                r8 = nil
              end
              if r8
                r4 = r8
              else
                if has_terminal?('minute', false, index)
                  r9 = instantiate_node(SyntaxNode,input, index...(index + 6))
                  @index += 6
                else
                  terminal_parse_failure('minute')
                  r9 = nil
                end
                if r9
                  r4 = r9
                else
                  if has_terminal?('min', false, index)
                    r10 = instantiate_node(SyntaxNode,input, index...(index + 3))
                    @index += 3
                  else
                    terminal_parse_failure('min')
                    r10 = nil
                  end
                  if r10
                    r4 = r10
                  else
                    if has_terminal?('hours', false, index)
                      r11 = instantiate_node(SyntaxNode,input, index...(index + 5))
                      @index += 5
                    else
                      terminal_parse_failure('hours')
                      r11 = nil
                    end
                    if r11
                      r4 = r11
                    else
                      if has_terminal?('hour', false, index)
                        r12 = instantiate_node(SyntaxNode,input, index...(index + 4))
                        @index += 4
                      else
                        terminal_parse_failure('hour')
                        r12 = nil
                      end
                      if r12
                        r4 = r12
                      else
                        if has_terminal?('hr', false, index)
                          r13 = instantiate_node(SyntaxNode,input, index...(index + 2))
                          @index += 2
                        else
                          terminal_parse_failure('hr')
                          r13 = nil
                        end
                        if r13
                          r4 = r13
                        else
                          if has_terminal?('h', false, index)
                            r14 = instantiate_node(SyntaxNode,input, index...(index + 1))
                            @index += 1
                          else
                            terminal_parse_failure('h')
                            r14 = nil
                          end
                          if r14
                            r4 = r14
                          else
                            @index = i4
                            r4 = nil
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
        s0 << r4
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Duration0)
      r0.extend(Duration1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:duration][start_index] = r0

    r0
  end

  module Distance0
    def number
      elements[0]
    end

    def distance_unit
      elements[2]
    end
  end

  module Distance1
    def meters
      number.text_value.to_f * case distance_unit.text_value
      when /^mi/; 1600; when /^k/;  1000; when /^m/;  1;
      when /^f/;  0.35; when /^b/;  200; else 1; end
    end
  end

  def _nt_distance
    start_index = index
    if node_cache[:distance].has_key?(index)
      cached = node_cache[:distance][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_number
    s0 << r1
    if r1
      r3 = _nt_ws
      if r3
        r2 = r3
      else
        r2 = instantiate_node(SyntaxNode,input, index...index)
      end
      s0 << r2
      if r2
        i4 = index
        if has_terminal?('miles', false, index)
          r5 = instantiate_node(SyntaxNode,input, index...(index + 5))
          @index += 5
        else
          terminal_parse_failure('miles')
          r5 = nil
        end
        if r5
          r4 = r5
        else
          if has_terminal?('mile', false, index)
            r6 = instantiate_node(SyntaxNode,input, index...(index + 4))
            @index += 4
          else
            terminal_parse_failure('mile')
            r6 = nil
          end
          if r6
            r4 = r6
          else
            if has_terminal?('mi', false, index)
              r7 = instantiate_node(SyntaxNode,input, index...(index + 2))
              @index += 2
            else
              terminal_parse_failure('mi')
              r7 = nil
            end
            if r7
              r4 = r7
            else
              if has_terminal?('km', false, index)
                r8 = instantiate_node(SyntaxNode,input, index...(index + 2))
                @index += 2
              else
                terminal_parse_failure('km')
                r8 = nil
              end
              if r8
                r4 = r8
              else
                if has_terminal?('kilometers', false, index)
                  r9 = instantiate_node(SyntaxNode,input, index...(index + 10))
                  @index += 10
                else
                  terminal_parse_failure('kilometers')
                  r9 = nil
                end
                if r9
                  r4 = r9
                else
                  if has_terminal?('k', false, index)
                    r10 = instantiate_node(SyntaxNode,input, index...(index + 1))
                    @index += 1
                  else
                    terminal_parse_failure('k')
                    r10 = nil
                  end
                  if r10
                    r4 = r10
                  else
                    if has_terminal?('meters', false, index)
                      r11 = instantiate_node(SyntaxNode,input, index...(index + 6))
                      @index += 6
                    else
                      terminal_parse_failure('meters')
                      r11 = nil
                    end
                    if r11
                      r4 = r11
                    else
                      if has_terminal?('m', false, index)
                        r12 = instantiate_node(SyntaxNode,input, index...(index + 1))
                        @index += 1
                      else
                        terminal_parse_failure('m')
                        r12 = nil
                      end
                      if r12
                        r4 = r12
                      else
                        if has_terminal?('ft', false, index)
                          r13 = instantiate_node(SyntaxNode,input, index...(index + 2))
                          @index += 2
                        else
                          terminal_parse_failure('ft')
                          r13 = nil
                        end
                        if r13
                          r4 = r13
                        else
                          if has_terminal?('feet', false, index)
                            r14 = instantiate_node(SyntaxNode,input, index...(index + 4))
                            @index += 4
                          else
                            terminal_parse_failure('feet')
                            r14 = nil
                          end
                          if r14
                            r4 = r14
                          else
                            if has_terminal?('f', false, index)
                              r15 = instantiate_node(SyntaxNode,input, index...(index + 1))
                              @index += 1
                            else
                              terminal_parse_failure('f')
                              r15 = nil
                            end
                            if r15
                              r4 = r15
                            else
                              if has_terminal?('blocks', false, index)
                                r16 = instantiate_node(SyntaxNode,input, index...(index + 6))
                                @index += 6
                              else
                                terminal_parse_failure('blocks')
                                r16 = nil
                              end
                              if r16
                                r4 = r16
                              else
                                if has_terminal?('block', false, index)
                                  r17 = instantiate_node(SyntaxNode,input, index...(index + 5))
                                  @index += 5
                                else
                                  terminal_parse_failure('block')
                                  r17 = nil
                                end
                                if r17
                                  r4 = r17
                                else
                                  @index = i4
                                  r4 = nil
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
        s0 << r4
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Distance0)
      r0.extend(Distance1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:distance][start_index] = r0

    r0
  end

  module Range0
    def min
      elements[0]
    end

    def max
      elements[2]
    end
  end

  module Range1
    def floor
      elements[0]
    end

  end

  module Range2
    def value
      case text_value
      when 'an', 'a', 'one', 'the' then (1..1)
      when 'some', 'all'           then (1..10000)
      when 'several'               then (3..10000)
      when 'many'                  then (5..10000)
      when /^\d+\+$/               then (floor.value..10000)
      when /^\d+\-\d+$/            then (min.value..max.value)
      when /^\d+$/                 then (floor.value..floor.value)
      else raise 'hell'
      end
    end
  end

  def _nt_range
    start_index = index
    if node_cache[:range].has_key?(index)
      cached = node_cache[:range][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    i1, s1 = index, []
    r2 = _nt_number
    s1 << r2
    if r2
      if has_terminal?('-', false, index)
        r3 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure('-')
        r3 = nil
      end
      s1 << r3
      if r3
        r4 = _nt_number
        s1 << r4
      end
    end
    if s1.last
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
      r1.extend(Range0)
    else
      @index = i1
      r1 = nil
    end
    if r1
      r0 = r1
      r0.extend(Range2)
    else
      i5, s5 = index, []
      r6 = _nt_number
      s5 << r6
      if r6
        if has_terminal?('+', false, index)
          r8 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure('+')
          r8 = nil
        end
        if r8
          r7 = r8
        else
          r7 = instantiate_node(SyntaxNode,input, index...index)
        end
        s5 << r7
      end
      if s5.last
        r5 = instantiate_node(SyntaxNode,input, i5...index, s5)
        r5.extend(Range1)
      else
        @index = i5
        r5 = nil
      end
      if r5
        r0 = r5
        r0.extend(Range2)
      else
        if has_terminal?('an', false, index)
          r9 = instantiate_node(SyntaxNode,input, index...(index + 2))
          @index += 2
        else
          terminal_parse_failure('an')
          r9 = nil
        end
        if r9
          r0 = r9
          r0.extend(Range2)
        else
          if has_terminal?('a', false, index)
            r10 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure('a')
            r10 = nil
          end
          if r10
            r0 = r10
            r0.extend(Range2)
          else
            if has_terminal?('one', false, index)
              r11 = instantiate_node(SyntaxNode,input, index...(index + 3))
              @index += 3
            else
              terminal_parse_failure('one')
              r11 = nil
            end
            if r11
              r0 = r11
              r0.extend(Range2)
            else
              if has_terminal?('the', false, index)
                r12 = instantiate_node(SyntaxNode,input, index...(index + 3))
                @index += 3
              else
                terminal_parse_failure('the')
                r12 = nil
              end
              if r12
                r0 = r12
                r0.extend(Range2)
              else
                if has_terminal?('some', false, index)
                  r13 = instantiate_node(SyntaxNode,input, index...(index + 4))
                  @index += 4
                else
                  terminal_parse_failure('some')
                  r13 = nil
                end
                if r13
                  r0 = r13
                  r0.extend(Range2)
                else
                  if has_terminal?('several', false, index)
                    r14 = instantiate_node(SyntaxNode,input, index...(index + 7))
                    @index += 7
                  else
                    terminal_parse_failure('several')
                    r14 = nil
                  end
                  if r14
                    r0 = r14
                    r0.extend(Range2)
                  else
                    if has_terminal?('many', false, index)
                      r15 = instantiate_node(SyntaxNode,input, index...(index + 4))
                      @index += 4
                    else
                      terminal_parse_failure('many')
                      r15 = nil
                    end
                    if r15
                      r0 = r15
                      r0.extend(Range2)
                    else
                      if has_terminal?('all', false, index)
                        r16 = instantiate_node(SyntaxNode,input, index...(index + 3))
                        @index += 3
                      else
                        terminal_parse_failure('all')
                        r16 = nil
                      end
                      if r16
                        r0 = r16
                        r0.extend(Range2)
                      else
                        @index = i0
                        r0 = nil
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end

    node_cache[:range][start_index] = r0

    r0
  end

end

class LexerParser < Treetop::Runtime::CompiledParser
  include Lexer
end

end
