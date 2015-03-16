require "rails_helper"

RSpec.describe Waypoint, type: :model do

  it "should be able to create a new waypoint" do
    waypoint = FactoryGirl.create(:waypoint)
    expect(waypoint).not_to eql(nil)
    
    waypoint = FactoryGirl.create(:waypoint, lat: nil, long: nil)
    expect(waypoint.lat).to eql(nil)
    expect(waypoint.long).to eql(nil)
  end
  
end
