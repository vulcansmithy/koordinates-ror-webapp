require "rails_helper"

RSpec.describe User, type: :model do

  it "able to create a user with 5 sets of waypoints" do
    user = FactoryGirl.create(:user_with_waypoints)
    ap user
    ap user.waypoints
    
    expect(user).not_to be_nil
    expect(user.waypoints.count).to eq 5
  end
  
end
