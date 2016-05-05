class AddShortDescriptionToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :description, :text
  end
end
