class FixPluralCagesToCage < ActiveRecord::Migration
  def change
      rename_column :holding_cages, :mating_cages_id, :mating_cage_id
      rename_column :mice, :mating_cages_id, :mating_cage_id
      rename_column :mice, :holding_cages_id, :holding_cage_id
  end
end
