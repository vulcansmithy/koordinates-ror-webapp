class CreateWaypoints < ActiveRecord::Migration
  def change
    create_table :waypoints do |t|
      t.decimal  :lat,  :decimal, :precision => 15, :scale => 13
      t.decimal  :long, :decimal, :precision => 15, :scale => 13

      t.timestamps null: false
    end
  end
end
