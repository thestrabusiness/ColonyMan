class CreateHoldingCages < ActiveRecord::Migration
  def change
    create_table :holding_cages do |t|
      t.string :cage_id
      t.integer :occupancy
      t.string :sex
      t.date :dob

      t.timestamps null: false
    end
  end
end
