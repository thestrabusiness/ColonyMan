module Cages
  def fill_slot
    @slot = Slot.find(self.slotable_id)
    if @slot.occupied == false
     @slot.update_attribute :occupied, true
    end      
  end
  
  def empty_slot
    @slot = Slot.find(self.slotable_id)
    if @slot.occupied == true
      @slot.update_attribute :occupied, false
    end      
  end
  
  def update_pop(method)
    if method == "create"
      self.occupancy += 1
    else
      self.occupancy -= 1
    end
    self.save
  end
  
end