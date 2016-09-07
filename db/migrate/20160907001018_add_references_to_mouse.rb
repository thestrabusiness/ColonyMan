class AddReferencesToMouse < ActiveRecord::Migration
  def change
    add_reference :mice, :holding_cages
    add_reference :mice, :mating_cages
  end
end
