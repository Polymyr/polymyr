class AddUploadsToProducts < ActiveRecord::Migration
  def change
    add_reference :uploads, :product, index: true, foreign_key: true
  end
end
