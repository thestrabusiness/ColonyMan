class AddCages < ActiveRecord::Migration
  def change
    create_table :cages do |t|
      t.string :type
      t.string :cage_label
      t.integer :occupancy
      t.string :sex
      t.date :dob
      t.integer :parent_cage_id
      t.string :strain
      
      t.references :slots, index: true
      t.references :mouse_racks, index: true
      
      t.timestamps
    end
  end
end
