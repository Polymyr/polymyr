class AddFieldsToMakers < ActiveRecord::Migration
  def change
  	add_column :makers, :first_name, :string
    add_column :makers, :last_name, :string
    add_column :makers, :company, :string
    add_column :makers, :website, :string
  end
end
