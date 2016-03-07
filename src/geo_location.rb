require_relative "./multimap"

class GeoLocation
    def add_person(person)
        @people.add_item(person.coordinates, person)
    end

    def get_people_at(coordinates)
        @people.get_items(coordinates)
    end

    def initialize
        @people = Multimap.new
    end

    def is_person_located_at(person, coordinates)
        @people.has_key?(coordinates) && @people.get_items(coordinates).include?(person)
    end
end
