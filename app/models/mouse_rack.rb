class MouseRack < ActiveRecord::Base
  has_many :holding_cages
  has_many :mating_cages
  has_many :mice, through: :mating_cages
  has_many :mice, through: :holding_cages
end
