require_relative './coordinates'

# A Person is someone with a location on Earth.
class Person
  attr_reader :coordinates

  def initialize(coordinates)
    @coordinates = coordinates
  end
end
