class TwoDimensionalArray
    def add_item(x, y, item)
        if (x >= @width)
            raise ArgumentError, "x is out of range"
        elsif (y >= @height)
            raise ArgumentError, "y is out of range"
        end

        @items[@width * y + x] = item
    end

    def initialize(width, height)
        @height = height
        @items = Array.new(height * width)
        @width  = width
    end

    def get_item_at(x, y)
        @items[@width * y + x]
    end
end
