# An Element is a container for an key/value pair in a HashClass. It also
# contains the hashed key value for quick reuse.
class Element
  attr_accessor :value
  attr_reader   :key, :key_hash

  def collides_with?(element)
    raise TypeError, 'Argument must be Element' unless element.is_a?(Element)

    @key != element.key
  end

  def initialize(key, key_hash, value)
    @key      = key
    @key_hash = key_hash
    @value    = value
  end
end
