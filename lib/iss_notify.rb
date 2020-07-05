require 'open-uri'
require 'httparty'

class Location
  attr_accessor :latitude, :longitude
  include HTTParty
  ISS_URI = 'http://api.open-notify.org/iss-now.json'
  MY_LOC_URI = 'api.ipgeolocation.io'
  MY_LOC_PATH = '/ipgeo'

  def initialize(optional = omitted = true)
    location = if omitted
      self.class.get(ISS_URI)
    else
      self.class.get(build_uri(build_query(optional)))
    end
    @latitude = deep_find(location, 'latitude').to_f
    @longitude = deep_find(location, 'longitude').to_f
    puts '=' * 10
    puts "Comparing ip address: #{optional}" unless omitted
    puts omitted ? 'ISS Location' : 'Your Location'
    puts "Latitude: #{@latitude}"
    puts "Longitude: #{@longitude}"
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
    iss_lat, iss_long = other.latitude, other.longitude
    latitude.between?(iss_lat - 5, iss_lat + 5) && longitude.between?(iss_long - 5, iss_long + 5)
  end

  private

    def build_query(ip_address)
      {
        apiKey: ENV['IP_GEO_LOC_KEY'],
        ip: ip_address
      }
    end

    def build_uri(query)
      URI::HTTPS.build(
        host: MY_LOC_URI,
        path: MY_LOC_PATH,
        query: URI.encode_www_form(query)
      )
    end
end