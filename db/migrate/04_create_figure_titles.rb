class CreateFigureTitles < ActiveRecord::Migration
  def change
    create_table :figure_titles do | col |
      col.integer :figure_id
      col.integer :title_id
    end
  end
end 
