class AddParentsToHoldingCages < ActiveRecord::Migration
  def change
    add_reference :holding_cages, :mating_cages
    add_column :holding_cages, :parents, :string
    
    add_column :holding_cages, :strain, :string
  end
end
