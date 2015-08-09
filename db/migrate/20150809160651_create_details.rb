class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.string :filename
      t.string :email
      t.integer :user_id
      t.integer :post

      t.timestamps null: false
    end
  end
end
