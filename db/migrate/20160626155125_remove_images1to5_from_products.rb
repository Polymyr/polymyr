class RemoveImages1to5FromProducts < ActiveRecord::Migration
  def change
  	remove_column :products, :image1_file_name
  	remove_column :products, :image1_content_type
  	remove_column :products, :image1_file_size
  	remove_column :products, :image1_updated_at
  	remove_column :products, :image2_file_name
  	remove_column :products, :image2_content_type
  	remove_column :products, :image2_file_size
  	remove_column :products, :image2_updated_at
  	remove_column :products, :image3_file_name
  	remove_column :products, :image3_content_type
  	remove_column :products, :image3_file_size
  	remove_column :products, :image3_updated_at
  	remove_column :products, :image4_file_name
  	remove_column :products, :image4_content_type
  	remove_column :products, :image4_file_size
  	remove_column :products, :image4_updated_at
  	remove_column :products, :image5_file_name
  	remove_column :products, :image5_content_type
  	remove_column :products, :image5_file_size
  	remove_column :products, :image5_updated_at
  end
end
