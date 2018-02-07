class CreateLandmarks < ActiveRecord::Migration
  def change
    create_table :landmarks do | col |
      col.string :name
      col.integer :figure_id
      col.integer :year_completed
    end
  end
end
