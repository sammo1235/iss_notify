require 'rails_helper'

RSpec.describe Location, type: :model do
  let(:my_loc) { Location.new(Rails.application.credentials.aws[:my_location_key]) }
  let(:iss_loc) { Location.new('http://api.open-notify.org/iss-now.json') }
  
  describe "#latitude and #longitude" do
    it "gives a latitude within expected values" do
      expect(my_loc.latitude).to be_between(-90, 90).inclusive
      expect(iss_loc.latitude).to be_between(-90, 90).inclusive
    end
      
    it "gives a longitude within expected values" do
      expect(my_loc.longitude).to be_between(-180, 180).inclusive
      expect(iss_loc.longitude).to be_between(-180, 180).inclusive
    end
  end
  
  describe "when ISS is #in_range?" do
    before do
      my_loc.latitude = 12.312
      my_loc.longitude = 0.414
      iss_loc.latitude = 11.123
      iss_loc.longitude = 0.321
    end
    
    it 'returns true when both coordinates are within 5 degrees' do
      expect(my_loc.in_range?(iss_loc)).to be true
    end
  end
  
  describe "when ISS is NOT #in_range?" do
    before do
      my_loc.latitude = 89.312
      my_loc.longitude = 100.414
      iss_loc.latitude = 11.123
      iss_loc.longitude = 0.321
    end
    
    it 'returns false when both coordinates are within 5 degrees' do
      expect(my_loc.in_range?(iss_loc)).to be false
    end
  end
end
