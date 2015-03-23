class CreateWaypoints < ActiveRecord::Migration
  def change
    create_table :waypoints do |t|
      t.decimal  :latitude,  :decimal, :precision => 15, :scale => 10
      t.decimal  :longitude, :decimal, :precision => 15, :scale => 10
      t.integer  :user_id
      
      t.timestamps null: false

    end
  end
end
