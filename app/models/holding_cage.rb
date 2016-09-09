class HoldingCage < ActiveRecord::Base
  belongs_to :mouse_rack
  belongs_to :slotable, polymorphic: true
  has_many :mating_cages
  has_many :mice
  
  after_create :fill_slot
  after_destroy :empty_slot
  
  def fill_slot
    @slot = Slot.find(self.slot_id)
    if @slot.occupied == false
     @slot.update_attribute :occupied, true
    end      
  end
  
  def empty_slot
    @slot = Slot.find(self.slot_id)
    if @slot.occupied == true
      @slot.update_attribute :occupied, false
    end      
  end      
    
end
