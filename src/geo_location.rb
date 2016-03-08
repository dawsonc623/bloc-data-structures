require_relative './multimap'

# A GeoLocation is a collection of the coordinates of people on Earth.
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

  def person_located_at?(person, coordinates)
    @people.key?(coordinates) && @people.get_items(coordinates).include?(person)
  end
end
