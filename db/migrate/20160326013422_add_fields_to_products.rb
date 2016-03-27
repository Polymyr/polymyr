class AddFieldsToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :name, :string
    add_column :products, :description, :text
    add_column :products, :price, :integer
    add_column :products, :rebate, :integer
    add_column :products, :quantity, :integer
  end
end
