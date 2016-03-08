# A Pixel is a pixel on a screen.
class Pixel
  def blue
    @color.blue
  end

  def green
    @color.green
  end

  def initialize(color, location)
    @color    = color
    @location = location
  end

  def red
    @color.red
  end

  def x
    @location.x
  end

  def y
    @location.y
  end
end
