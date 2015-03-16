require "rails_helper"

RSpec.describe Waypoint, type: :model do

  it "should create a valid waypoint" do
    waypoint = FactoryGirl.create(:waypoint) 
    ap waypoint

    expect(waypoint).to be_valid
  end
  
end
