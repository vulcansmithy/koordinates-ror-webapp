class WaypointSerializer < ActiveModel::Serializer
  attributes :lat, :long, :created_at
end
