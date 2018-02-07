class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do | col |
      col.string :name
    end
  end
end 
