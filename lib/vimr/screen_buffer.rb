module Vimr
  class ScreenBuffer
    def initialize(size, buffer)
      @size = size
      @buffer = buffer
    end

    def at(linenum)
      buffer_top = @buffer.at(linenum)
      @size.height.times do
        line = buffer_top.succ
        break unless line
        yield LineBuffer.new(line, @size.width)
      end
    end
  end
end
