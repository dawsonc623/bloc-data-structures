# A TwoDimensionalArray allows items to be arranged using two separate indices,
# which implies two separate dimensions of storage.
class TwoDimensionalArray
  def add_item(x, y, item)
    raise ArgumentError, 'x is out of range' if x >= @width
    raise ArgumentError, 'y is out of range' if y >= @height

    @items[@width * y + x] = item
  end

  def initialize(width, height)
    @height = height
    @items  = Array.new(height * width)
    @width  = width
  end

  def get_item_at(x, y)
    @items[@width * y + x]
  end
end
