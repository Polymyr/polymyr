class AddAddressToIpAddresses < ActiveRecord::Migration
  def change
    add_column :ip_addresses, :address, :string
    add_column :ip_addresses, :count, :integer
  end
end
