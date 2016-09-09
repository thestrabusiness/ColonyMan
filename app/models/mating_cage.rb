class MatingCage < ActiveRecord::Base
  belongs_to :mouse_rack
  belongs_to :slots
  belongs_to :holding_cage
  has_many :mice
  
  after_create :fill_slot
  after_destroy :empty_slot
  
  def fill_slot
    if self.slot.occupied == false
      self.slot.update_attribute! :occupied, true
    end      
  end
  
  def empty_slot
    if self.slot.occupied == true
      self.slot.update_attribute! :occupied, false
    end      
  end    
    
end
