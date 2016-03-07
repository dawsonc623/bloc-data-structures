require_relative "./coordinates"

class Person
    attr_reader :coordinates

    def initialize(coordinates)
        @coordinates = coordinates
    end
end
