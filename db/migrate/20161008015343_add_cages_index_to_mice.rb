class AddCagesIndexToMice < ActiveRecord::Migration
  def change
    add_reference :mice, :cages, index: true
  end
end
