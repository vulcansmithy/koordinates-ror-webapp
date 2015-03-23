require "rails_helper"

describe Api::V1::UserController do

  it "should be able to return a set of waypoints" do
    user = FactoryGirl.create :user_with_waypoints
    get "/api/user/#{user.id}/waypoints"

    expect(response.code).to eq "200"
    
    expect(JSON.parse(response.body).count).to eq user.waypoints.count
  end

  it "should return a 'not_found' when passed with non-existing user_id" do
    get "/api/user/1234/waypoints"
    
    expect(response.code).to eq "404"
  end
  
  it "should be able to add a new waypoint" do
    user = FactoryGirl.create :user
    expect(user).not_to be_nil
    
    latitude  = FFaker::Geolocation.lat
    longitude = FFaker::Geolocation.lng 
    notes     = FFaker::Lorem.sentence

    post "/api/user/#{user.id}/waypoints", { latitude: latitude, longitude: longitude, notes: notes } 
    
    expect(response.code).to eq "201"
    expect(JSON.parse(response.body)["waypoint"]["notes"]).to eql notes
  end

end
