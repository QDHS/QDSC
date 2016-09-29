class AddClaimToLfObjects < ActiveRecord::Migration[5.0]
  def change
    add_column :lf_objects, :claim, :uni_users
  end
end
