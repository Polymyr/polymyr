class AddVideoToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :youtube_url, :string
  end
end
