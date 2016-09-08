class Slot < ActiveRecord::Base
  belongs_to :mouse_racks
  
  validates :position, presence: true
  validates :side, presence: true
  validates :occupied, inclusion: { in: [ true, false ] }
  validates :mouse_rack_id, presence: true
  
end
