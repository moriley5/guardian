class CreateGuardianProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :guardian_profiles do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.string :image, null: false
      t.attachment :picture
      t.timestamps(null: false)
    end
  end
end
