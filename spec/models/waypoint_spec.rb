require "rails_helper"

RSpec.describe Waypoint, type: :model do

  it "should be able to create a valid waypoint" do
    waypoint = FactoryGirl.create(:waypoint) 

    expect(waypoint).to be_valid
  end
  
end
