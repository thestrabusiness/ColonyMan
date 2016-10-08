class RemoveMatingCageFromMice < ActiveRecord::Migration
  def change
    remove_column :mice, :mating_cage_id
    remove_column :mice, :holding_cage_id
    
    add_reference :cages, index: true
  end
end
