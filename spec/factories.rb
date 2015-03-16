FactoryGirl.define do 
  
  factory :waypoint do
    lat   FFaker::Geolocation.lat
    long  FFaker::Geolocation.lng
  end
end