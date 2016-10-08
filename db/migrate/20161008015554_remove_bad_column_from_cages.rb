class RemoveBadColumnFromCages < ActiveRecord::Migration
  def change
    remove_reference :cages, index: true
  end
end
