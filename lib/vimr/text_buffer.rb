module Vimr
  class TextBuffer
    def initialize
      @lines = []
    end

    def <<(line)
      @lines << line
    end

    def [](linenum)
      @lines[linenum]
    end

    def at(linenum)
      TextBufferPtr.new(self, linenum)
    end

    def line_size
      @lines.size
    end

    def self.load(path)
      self.new.tap do |buf|
        File.open(path) do |f|
          f.readlines.each do |line|
            buf << line
          end
        end
      end
    end

    class TextBufferPtr
      def initialize(buf, linenum)
        @buf = buf
        @linenum = linenum
      end

      def succ
        line = @buf[@linenum]
        @linenum += 1
        line
      end
    end
  end
end
