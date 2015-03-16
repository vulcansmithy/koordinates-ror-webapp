class CreateWaypoints < ActiveRecord::Migration
  def change
    create_table :waypoints do |t|
      t.decimal  :lat,  :precision => 15, :scale => 13
      t.decimal  :long, :precision => 15, :scale => 13

      t.timestamps null: false
    end
  end
end
