class AddUserClassToUniUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :uni_users, :user_class, :string
  end
end
