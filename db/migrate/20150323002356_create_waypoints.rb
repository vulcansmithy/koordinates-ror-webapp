class CreateWaypoints < ActiveRecord::Migration
  def change
    create_table :waypoints do |t|
      t.decimal  :latitude,  :precision => 15, :scale => 10
      t.decimal  :longitude, :precision => 15, :scale => 10
      t.integer  :user_id
      
      t.timestamps null: false

    end
  end
end
