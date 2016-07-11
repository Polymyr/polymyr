class AddNameToProspects < ActiveRecord::Migration
  def change
  	add_column :prospects, :name, :string
  end
end
