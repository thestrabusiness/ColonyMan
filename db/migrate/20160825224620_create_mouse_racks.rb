class CreateMouseRacks < ActiveRecord::Migration
  def change
    create_table :mouse_racks do |t|
      t.integer :number
      t.string :type
      t.string :side

      t.timestamps null: false
    end
  end
end
