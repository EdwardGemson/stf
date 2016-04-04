class CreateRecordingSessions < ActiveRecord::Migration
  def change
    create_table :recording_sessions do |t|
      t.datetime :meeting_time, null: false
      t.integer :business_id, null: false
      t.integer :artist_id, null: false
      t.string :location, null: false
      t.timestamps null: false
    end
  end
end
