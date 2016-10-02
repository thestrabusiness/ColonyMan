class Slot < ActiveRecord::Base
  belongs_to :mouse_racks
  has_one :mating_cage, as: :slotable
  has_one :holding_cage, as: :slotable
  
  validates :position, presence: true
  validates :side, presence: true
  validates :occupied, inclusion: { in: [ true, false ] }
  validates :mouse_rack_id, presence: true
  
  def cage_info
    if self.holding_cage
      'holding_info'
    else
      'mating_info'
    end
  end
  
end
