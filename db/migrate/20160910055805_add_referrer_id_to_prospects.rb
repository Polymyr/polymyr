class AddReferrerIdToProspects < ActiveRecord::Migration
  def change
  	add_column :prospects, :referrer_id, :integer
  end
end
