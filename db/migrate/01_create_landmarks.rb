<<<<<<< HEAD
class CreateLandmarks < ActiveRecord::Migration
  def change
    create_table :landmarks do | col |
      col.string :name
      col.integer :figure_id
      col.integer :year_completed
    end
  end
=======
class CreateLandmarks < ActiveRecord::Migration[4.2]
  raise "Write CreateLandmarks migration here"
>>>>>>> e692d507fae87335bd0ff50b0aafded2460b89af
end
