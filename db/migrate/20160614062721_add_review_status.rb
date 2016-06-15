class AddReviewStatus < ActiveRecord::Migration
  def up
    add_column :reviews, :status, :string
  end

  def down
    remove_column :reviews, :status
  end
end
