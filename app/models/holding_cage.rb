class HoldingCage < ActiveRecord::Base
  belongs_to :mouse_rack
  has_many :mating_cages
  has_many :mice
end
