class Waypoint < ActiveRecord::Base

  # == Relationships ==========================================================
  belongs_to :user
  
  # == Validations ============================================================
  validates_presence_of :latitude,  :on => :create, :message => "can't be blank"
  validates_presence_of :longitude, :on => :create, :message => "can't be blank"
  
  # == Class Methods ==========================================================
  def self.recognized_attributes
    [:latitude, :longitude, :notes]
  end

end
