require 'rails_helper'

describe IssLocation do
  let(:iss_loc) { IssLocation.new }
  
  describe "#iss_lat and #iss_long" do
    it "gives a latitude within expected values" do
      expect(iss_loc.iss_lat).to be_between(-90, 90).inclusive
    end
    
    it "gives a longitude within expected values" do
      expect(iss_loc.iss_long).to be_between(-180, 180).inclusive
    end
  end
end