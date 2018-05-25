require "vimr/version"

module Vimr
  class Size
    attr_reader :width, :height

    def initialize(width, height)
      @width = width
      @height = height
    end
  end

  class Position
    attr_reader :x, :y

    def initialize(x, y)
      @x = x
      @y = y
    end

    def up
      @y -= 1
    end

    def down
      @y += 1
    end
  end
end

require "vimr/text_buffer"
require "vimr/line_buffer"
require "vimr/screen_buffer"
require "vimr/screen"
