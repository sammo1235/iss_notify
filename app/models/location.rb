class Location
  attr_accessor :latitude, :longitude
  include HTTParty

  def initialize(uri)
    location = self.class.get(uri)
    @latitude = deep_find(location, 'latitude').to_f
    @longitude = deep_find(location, 'longitude').to_f
  end
  
  def deep_find(obj, key)
    if obj.respond_to?(:key?) && obj.key?(key)
      obj[key]
    elsif obj.respond_to?(:each)
      r = nil
      obj.find { |*a| r = deep_find(a.last, key) }
      r
    end
  end
  
  def in_range?(other)
    iss_lat = other.latitude; iss_long = other.longitude
    latitude.between?(iss_lat - 5, iss_lat + 5) && longitude.between?(iss_long - 5, iss_long + 5)
  end
end