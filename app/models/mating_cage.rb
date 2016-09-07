class MatingCage < ActiveRecord::Base
  belongs_to :mouse_rack
  belongs_to :holding_cage
  has_many :mice
end
