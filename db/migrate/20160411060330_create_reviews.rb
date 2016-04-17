class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|

    	t.belongs_to :user, index: true
      t.belongs_to :product, index: true
      t.timestamps null: false
    end
  end
end
