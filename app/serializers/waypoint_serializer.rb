class WaypointSerializer < ActiveModel::Serializer
  attributes :latitude, :longitude, :created_at
end
