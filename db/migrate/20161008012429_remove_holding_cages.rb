class RemoveHoldingCages < ActiveRecord::Migration
  def change
    drop_table :holding_cages
  end
end
