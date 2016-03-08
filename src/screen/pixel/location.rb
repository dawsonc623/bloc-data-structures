# A Location is the horizontal and vertical offset of a pixel on a screen.
class Location
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end
end
