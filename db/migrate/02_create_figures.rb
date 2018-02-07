class CreateFigures < ActiveRecord::Migration
  def change
    create_table :figures do | col |
      col.string :name
    end
  end
end 
