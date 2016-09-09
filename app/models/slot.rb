class Slot < ActiveRecord::Base
  belongs_to :mouse_racks
  has_many :mating_cages, as: :slotable
  has_many :holding_cages, as: :slotable
  
  validates :position, presence: true
  validates :side, presence: true
  validates :occupied, inclusion: { in: [ true, false ] }
  validates :mouse_rack_id, presence: true
  
end
