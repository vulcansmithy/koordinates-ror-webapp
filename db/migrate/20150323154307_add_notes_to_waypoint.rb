class AddNotesToWaypoint < ActiveRecord::Migration
  def change
    add_column :waypoints, :notes, :text
  end
end