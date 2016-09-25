class CreateLfObjects < ActiveRecord::Migration[5.0]
  def change
    create_table :lf_objects do |t|
      t.string :description
      t.string :title
      t.string :image

      t.timestamps
    end
  end
end
