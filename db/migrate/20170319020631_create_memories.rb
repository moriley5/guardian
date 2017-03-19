class CreateMemories < ActiveRecord::Migration[5.0]
  def change
    create_table :memories do |t|
      t.integer :guardian_id, null: false
      t.string :audio_recording, null: false
      t.string :description, null: false
      t.datetime :date
      t.timestamps(null: false)
    end
  end
end
