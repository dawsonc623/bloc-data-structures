# A Coordinates contains the latitude and longitude values for a location on
# Earth. Values are rounded to five decimal places.
class Coordinates
  attr_reader :latitude, :longitude

  def hash
    @latitude.hash ^ @longitude.hash
  end

  def initialize(latitude, longitude)
    @latitude  = latitude.round(5)
    @longitude = longitude.round(5)
  end

  def eql?(other)
    @latitude == other.latitude && @longitude == other.longitude
  end
end
