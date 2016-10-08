class AddRackIndexToSlots < ActiveRecord::Migration
  def change
    add_reference :slots, :mouse_racks, index: true
  end
end
