class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.text :caption
      t.integer :lesson_id
      t.integer :user_id
      t.timestamps
    end
    add_index :photos, [:caption, :lesson_id]
    add_index :photos, :lesson_id
  end
end
