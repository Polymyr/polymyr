class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|

    	t.belongs_to :users, index: true
      t.belongs_to :products, index: true
      t.timestamps null: false
    end
  end
end
