class User < ActiveRecord::Base

  # == Relationships ==========================================================
  has_many :waypoints

end
