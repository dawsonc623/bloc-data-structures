# A Color is an RGB value for a pixel color on a screen.
class Color
  attr_reader :blue, :green, :red

  def initialize(red, green, blue)
    @blue  = blue
    @green = green
    @red   = red
  end
end
