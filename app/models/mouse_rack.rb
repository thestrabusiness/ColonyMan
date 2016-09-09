class MouseRack < ActiveRecord::Base
  
  self.inheritance_column = :fake_column
  
  has_many :holding_cages, through: :slots
  has_many :mating_cages, through: :slots
  has_many :slots, dependent: :destroy
  
  validates :number, presence: true
  validates :side, presence: true
  validates :type, presence: true
  
  after_create :create_slots
    
  def create_slots
    slot_count = 1
    70.times do
      Slot.create(:position => slot_count, :side => self.side, :occupied => false, :mouse_rack_id => self.id)
      slot_count += 1 
    end
  end
  
end
