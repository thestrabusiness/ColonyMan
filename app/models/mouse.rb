class Mouse < ActiveRecord::Base
  belongs_to :holding_cage
  belongs_to :mating_cage
end
