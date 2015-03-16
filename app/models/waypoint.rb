class Waypoint < ActiveRecord::Base

  # == Relationships ==========================================================
  belongs_to :user
  
  # == Validations ============================================================
  validates_presence_of :lat,  :on => :create, :message => "can't be blank"
  validates_presence_of :long, :on => :create, :message => "can't be blank"
  
end
