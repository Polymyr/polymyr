class RemoveNameFromProspects < ActiveRecord::Migration
  def change
    remove_column :prospects, :name, :string
  end
end
