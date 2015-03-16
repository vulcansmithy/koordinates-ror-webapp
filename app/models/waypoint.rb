class Waypoint < ActiveRecord::Base
  
  belongs_to :user
  
  validates_presence_of :lat,  :on => :create, :message => "can't be blank"
  validates_presence_of :long, :on => :create, :message => "can't be blank"

end
