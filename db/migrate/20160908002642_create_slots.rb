class CreateSlots < ActiveRecord::Migration
  def change
    create_table :slots do |t|
      t.integer :position
      t.boolean :occupied
      t.string :side
      t.belongs_to :mouse_racks
      
      t.timestamps null: false
    end
    
    add_reference :holding_cages, :slots
    add_reference :mating_cages, :slots
  end
end
