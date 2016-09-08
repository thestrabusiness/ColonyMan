class ChangeMouseRacksIdColumnName < ActiveRecord::Migration
  def change
    rename_column :slots, :mouse_racks_id, :mouse_rack_id
    rename_column :mating_cages, :mouse_racks_id, :mouse_rack_id
    rename_column :holding_cages, :mouse_racks_id, :mouse_rack_id    
  end
end
