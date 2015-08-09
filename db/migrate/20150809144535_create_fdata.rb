class CreateFdata < ActiveRecord::Migration
  def change
    create_table :fdata do |t|
      t.string :email
      t.string :filename
      t.integer :postid

      t.timestamps null: false
    end
  end
end
