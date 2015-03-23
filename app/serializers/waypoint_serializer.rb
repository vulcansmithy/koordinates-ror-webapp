class WaypointSerializer < ActiveModel::Serializer
  attributes :latitude, :longitude, :notes, :created_at
end
