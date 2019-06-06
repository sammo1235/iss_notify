class LocationsController < ApplicationController
    
  def new
  #  IssLocation.new
  #  MyLocation.new
  end
  
  def check_not
    if @my_lat > @lower_iss_lat && @my_lat < @upper_iss_lat && @my_long > @lower_iss_long && @my_lat < @upper_iss_long
    
      return true
    else
      false
    end
  end
end
