class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :email, null: false
      t.string :name, null: false
      t.string :password_digest, null: false
      t.timestamps null: false
    end
  end
end
