class AddIndexToManyTables < ActiveRecord::Migration
  def change
      add_index :holding_cages, [:slot_id, :mouse_rack_id]
      add_index :mating_cages, [:slot_id, :mouse_rack_id]      
  end
end
