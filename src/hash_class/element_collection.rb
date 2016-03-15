# An ElementCollection maintains the Elements in a HashClass.
class ElementCollection
  def [](index)
    # TODO: Deprecate
    @elements[index]
  end

  def capacity
    @elements.length
  end

  def collides_at?(other, index)
    element = @elements[index]

    !element.nil? && element.collides_with?(other)
  end

  def contains?(element)
  end

  def hash_collides_at?(other, index)
    element = @elements[index]

    !element.nil? && element.collides_with?(other) &&
      element.key_hash == other.key_hash
  end

  def increase_capacity
    current_elements = @elements.compact
    new_capacity     = 2**(Math.log2(@elements.length).floor + 1) + 1
    new_capacity    += 2 until Prime.prime?(new_capacity)

    @elements = Array.new(new_capacity)

    current_elements.each do |element|
      insert_element(element)
    end
  end

  def initialize(initial_capacity)
    @elements = Array.new(initial_capacity)
  end

  def insert_element(element)
    raise TypeError, 'Argument must be Element' unless element.is_a?(Element)

    index = element.key_hash % @elements.length

    raise ArgumentError, 'Hash collision' if hash_collides_at?(element, index)

    while collides_at?(element, index)
      increase_capacity
      index = element.key_hash % @elements.length
    end

    @elements[index] = element
  end
end
