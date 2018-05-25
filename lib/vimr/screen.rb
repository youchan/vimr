module Vimr
  class Screen
    def initialize
      @size = Size.new(80, 20)
      @text_buffer = TextBuffer.load(ARGV.first)
      @screen_buffer = ScreenBuffer.new(@size, @text_buffer)
      @cursor = TTY::Cursor
      @cursor_pos = Position.new(0, 0)
      @start_at = 0
      refresh
    end

    def refresh
      print @cursor.clear_screen
      print @cursor.move_to(0, 0)

      @screen_buffer.at(@start_at) do |line|
        print line.to_s
      end

      move_to(@cursor_pos.x, @cursor_pos.y)
    end

    def move_to(x, y)
      print @cursor.move_to(x, y)
      @cursor_pos = Position.new(x, y)
    end

    def up
      return if @start_at <= 0
      if @cursor_pos.y <= 0
        @start_at -= 1
        refresh
      else
        print @cursor.up
        @cursor_pos.up
      end
    end

    def down
      return if @start_at + @size.height >= @text_buffer.line_size
      if @cursor_pos.y >= @size.height
        @start_at += 1
        refresh
      else
        print @cursor.down
        @cursor_pos.down
      end
    end
  end
end
