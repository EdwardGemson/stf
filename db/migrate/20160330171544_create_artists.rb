class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.timestamps null: false
    end
  end
end
