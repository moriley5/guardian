class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.integer :guardian_id, null: false
      t.string :title, null: false
      t.string :body
      t.timestamps(null: false)
    end
  end
end
