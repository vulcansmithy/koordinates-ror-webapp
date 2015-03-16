FactoryGirl.define do 
  
  factory :user do
    first_name FFaker::Name.first_name
    last_name  FFaker::Name.last_name
    email      { "#{first_name}.#{last_name}@example.com".downcase }
    
    factory :user_with_waypoints do
      after(:create) do |user|
        5.times do
          lat  = FFaker::Geolocation.lat
          long =  FFaker::Geolocation.lng
          create(:waypoint, lat: lat, long: long, user: user)
        end
      end
    end
  end
  
  factory :waypoint do
    lat   FFaker::Geolocation.lat
    long  FFaker::Geolocation.lng
  end
  
end