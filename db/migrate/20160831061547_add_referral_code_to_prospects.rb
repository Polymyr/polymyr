class AddReferralCodeToProspects < ActiveRecord::Migration
  def change
    add_column :prospects, :referral_code, :string
  end
end
