class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title, null: false
      t.integer :album_id

      t.timestamps null: false
    end
  end
end
