require_relative '../src/geo_location'
require_relative '../src/geo_location/coordinates'
require_relative '../src/geo_location/person'

RSpec.describe GeoLocation do
  it 'should contain a latitude and longitude mark for a person' do
    coordinates  = Coordinates.new(43.063348, -87.966695)
    geo_location = GeoLocation.new
    person       = Person.new(coordinates)

    geo_location.add_person(person)

    expect(geo_location.person_located_at?(person, coordinates)).to(be(true))
  end

  it 'should use one meter as the smallest surface area' do
    # Approximately 0.00001 degrees is 1 meter

    coordinates1 = Coordinates.new(43.063348, -87.966695)
    coordinates2 = Coordinates.new(43.063352, -87.966701)
    geo_location = GeoLocation.new
    person       = Person.new(coordinates1)

    geo_location.add_person(person)

    expect(geo_location.get_people_at(coordinates2)).to(contain_exactly(person))
  end

  it 'should allow more than one person to occupy the same position' do
    # Approximately 0.00001 degrees is 1 meter

    coordinates  = Coordinates.new(43.063348, -87.966695)
    geo_location = GeoLocation.new
    person1      = Person.new(coordinates)
    person2      = Person.new(coordinates)

    geo_location.add_person(person1)
    geo_location.add_person(person2)

    expect(geo_location.get_people_at(coordinates))
      .to(contain_exactly(person1, person2))
  end
end
