FactoryGirl.define do 
  
  factory :user do
    first_name FFaker::Name.first_name
    last_name  FFaker::Name.last_name
    email      { "#{first_name}.#{last_name}@example.com".downcase }
    
    factory :user_with_waypoints do
      after(:create) do |user|
        5.times do
          latitude  = FFaker::Geolocation.lat
          longitude = FFaker::Geolocation.lng
          create(:waypoint, latitude: latitude, longitude: longitude, user: user)
        end
      end
    end
  end
  
  factory :waypoint do
    latitude   FFaker::Geolocation.lat
    longitude  FFaker::Geolocation.lng
  end
  
end