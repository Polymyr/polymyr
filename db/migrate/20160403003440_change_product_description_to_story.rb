class ChangeProductDescriptionToStory < ActiveRecord::Migration
  def change
  	rename_column :products, :description, :story
  end
end
