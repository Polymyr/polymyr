class CreateProspects < ActiveRecord::Migration
  def change
    create_table :prospects do |t|
    	t.string :email,              null: false, default: ""

      t.timestamps null: false
    end

    add_index :prospects, :email,                unique: true
  end
end
