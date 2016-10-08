class FixPluralization < ActiveRecord::Migration
  def change
    remove_index :cages, :slots_id
    remove_index :cages, :mouse_racks_id
    remove_index :mice, :cages_id
    remove_index :slots, :mouse_racks_id
    
    remove_column :cages, :slots_id
    remove_column :cages, :mouse_racks_id
    remove_column :mice, :cages_id
    remove_column :slots, :mouse_racks_id
    

  end
end
