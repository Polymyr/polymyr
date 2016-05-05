class AddAddressFieldsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :address, :text
  	add_column :users, :city, :string
  	add_column :users, :zip, :string
  end
end
