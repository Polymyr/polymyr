class AddStripeConnectToMakers < ActiveRecord::Migration
  def change
    add_column :makers, :stripe_publishable_key, :string
    add_column :makers, :stripe_user_id, :string
    add_column :makers, :refresh_token, :string
    add_column :makers, :access_token, :string
  end
end
