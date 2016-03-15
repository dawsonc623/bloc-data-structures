require 'prime'
require_relative './hash_class/element'
require_relative './hash_class/element_collection'
require_relative './hash_class/fnv'

# A HashClass is a structure allowing values to be stored and accessed via
# unique keys of any type
class HashClass
  def [](key)
    element = @elements[FNV.fnv_1a(key.to_s) % @elements.capacity]

    raise ArgumentError, 'Key not found' if element.nil? || element.key != key

    element.value
  end

  def []=(key, value)
    element = Element.new(key, FNV.fnv_1a(key.to_s), value)

    if @elements.contains?(element)
      @elements.update(element)
    else
      @elements.insert_element(element)
    end
  end

  def capacity
    @elements.capacity
  end

  def initialize
    @elements = ElementCollection.new(5)
  end

  def key?(key)
    index = FNV.fnv_1a(key.to_s) % @elements.capacity

    element_at_index = @elements[index]

    !element_at_index.nil? && element_at_index.key == key
  end
end
