class CreateMice < ActiveRecord::Migration
  def change
    create_table :mice do |t|
      t.date :dob
      t.string :sex
      t.integer :number
      t.string :genotype

      t.timestamps null: false
    end
  end
end
