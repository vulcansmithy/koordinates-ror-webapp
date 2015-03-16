class CreateWaypoints < ActiveRecord::Migration
  def change
    create_table :waypoints do |t|
      t.decimal  :lat,        precision: 10, scale: 6
      t.decimal  :long,       precision: 10, scale: 6
      t.integer  :user_id
      
      t.timestamps null: false
    end
  end
end
