class AddFullNameToMakers < ActiveRecord::Migration
  def change
  	remove_column :makers, :first_name
    remove_column :makers, :last_name
    add_column :makers, :name, :string
  end
end