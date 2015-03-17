require "rails_helper"

describe Api::V1::UserController do

  it "should be able to return a set of waypoints" do
    user = FactoryGirl.create :user_with_waypoints
    get "/api/user/#{user.id}/waypoints"

    expect(response.code).to eq "200"
    
    expect(JSON.parse(response.body)["waypoints"].count).to eq user.waypoints.count
  end

  it "should return a 'not_found' when passed with non-existing user_id" do
    get "/api/user/1234/waypoints"
    
    expect(response.code).to eq "404"
  end
  
  it "should be able to add a new waypoint" do
    user = FactoryGirl.create :user
    expect(user).not_to be_nil
    
    lat  = FFaker::Geolocation.lat
    long = FFaker::Geolocation.lng 
    post "/api/user/#{user.id}/waypoints", { "waypoint" => { lat: lat, long: long } }
    
    expect(response.code).to eq "201"
    
    expect( JSON.parse(response.body)["added_waypoint"]["lat"    ]).to eq lat.to_s 
    expect( JSON.parse(response.body)["added_waypoint"]["long"   ]).to eq long.to_s 
    expect( JSON.parse(response.body)["added_waypoint"]["user_id"]).to eq user.id
  end

end
