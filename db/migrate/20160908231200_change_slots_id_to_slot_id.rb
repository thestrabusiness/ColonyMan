class ChangeSlotsIdToSlotId < ActiveRecord::Migration
  def change
      rename_column :holding_cages, :slots_id, :slot_id
      rename_column :mating_cages, :slots_id, :slot_id
  end
end
