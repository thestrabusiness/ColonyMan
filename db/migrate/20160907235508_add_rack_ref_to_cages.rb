class AddRackRefToCages < ActiveRecord::Migration
  def change
    add_reference :holding_cages, :mouse_racks
    add_reference :mating_cages, :mouse_racks
  end
end
