class ChangeSlotReferenceToSlotableForCages < ActiveRecord::Migration
  def change
    remove_reference :mating_cages, :slot, index: true
    remove_reference :holding_cages, :slot, index: true
    
    add_reference :mating_cages, :slotable, polymorphic: true, index: true
    add_reference :holding_cages, :slotable, polymorphic: true, index: true   
    
  end
end
