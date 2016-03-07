class Multimap
    def add_item(key, value)
        if (!@items.has_key?(key))
            @items[key] = Set.new
        end

        @items[key].add(value)
    end

    def get_items(key)
        @items[key]
    end

    def has_key?(key)
        @items.has_key?(key)
    end

    def initialize
        @items = Hash.new()
    end
end
