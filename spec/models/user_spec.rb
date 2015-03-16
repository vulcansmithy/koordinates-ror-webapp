require "rails_helper"

RSpec.describe User, type: :model do

  it "should able to instantiate a new valid User with 5 associated waypoints" do
    user = FactoryGirl.create(:user_with_waypoints)
    expect(user).not_to be_nil
    expect(user.waypoints.count).to eq 5
  end
  
end
