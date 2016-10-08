class AddIndexes < ActiveRecord::Migration
  def change
    add_reference :cages, :slot, index: true
    add_reference :mice, :cage, index: true
    add_reference :cages, :mouse_rack, index: true
    add_index :slots, :mouse_rack_id    
  end
end
