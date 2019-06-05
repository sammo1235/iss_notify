class LocationsController < ApplicationController

  def new
    IssLocation.new
  end
    
  def iss_visible?
    if @iss_lat == (@my_lat + 10) || (@my_lat - 10)
      true
    end
  end
end
