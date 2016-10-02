class MatingCage < ActiveRecord::Base
  include Cages
  
  belongs_to :mouse_rack
  belongs_to :slotable, polymorphic: true
  has_many :mice
  
  after_create :fill_slot
  after_destroy :empty_slot
    
end
