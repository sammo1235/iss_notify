class Location
  include HTTParty
  
  def initialize(uri)
    @location = self.class.get(uri)
  end
end