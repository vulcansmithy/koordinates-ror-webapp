class AddUserIdToWaypoint < ActiveRecord::Migration
  def change
    add_column :waypoints, :user_id, :integer
  end
end
