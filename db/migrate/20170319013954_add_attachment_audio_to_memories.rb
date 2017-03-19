class AddAttachmentAudioToMemories < ActiveRecord::Migration
  def self.up
    change_table :memories do |t|
      t.attachment :audio
    end
  end
end
