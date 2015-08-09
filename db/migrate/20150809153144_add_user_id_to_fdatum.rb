class AddUserIdToFdatum < ActiveRecord::Migration
  def change
    add_column :fdata, :user_id, :string
  end
end
