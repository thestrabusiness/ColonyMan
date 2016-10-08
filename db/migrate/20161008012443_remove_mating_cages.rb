class RemoveMatingCages < ActiveRecord::Migration
  def change
    drop_table :mating_cages
  end
end
