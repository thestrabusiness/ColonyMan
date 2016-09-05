class CreateMatingCages < ActiveRecord::Migration
  def change
    create_table :mating_cages do |t|
      t.string :cage_id
      t.date :mated
      t.string :strain1
      t.string :strain2

      t.timestamps null: false
    end
  end
end
