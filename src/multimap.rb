# A Multimap is a data structure allowing multiple items to be identified by a
# single key.
class Multimap
  def add_item(key, value)
    @items[key] = Set.new unless @items.key?(key)

    @items[key].add(value)
  end

  def get_items(key)
    @items[key]
  end

  def initialize
    @items = {}
  end

  def key?(key)
    @items.key?(key)
  end
end
