class Memory < ApplicationRecord
  belongs_to :guardian_profile, foreign_key: :guardian_id

  has_attached_file :audio

  validates :guardian_id, :audio_recording, :description, presence: true
  validates_attachment :audio, presence: true, content_type: {content_type: "audio/mpeg"}, size: { in: 0..100.kilobytes }



  def formatted_date
    self.date.strftime("%m/%d/%Y")
  end
end
