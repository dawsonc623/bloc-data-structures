require_relative "two_dimensional_array"

class Screen
    def add_pixel(pixel)
        @pixels.add_item(pixel.x, pixel.y, pixel)
    end

    def initialize(width, height)
        @pixels = TwoDimensionalArray.new(width, height)
    end

    def get_pixel_at(x, y)
        @pixels.get_item_at(x, y)
    end
end