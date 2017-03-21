class Memory < ApplicationRecord
  belongs_to :guardian_profile, foreign_key: :guardian_id

  has_attached_file :audio, :content_type => ["audio/x-m4a", "audio/m4a", "audio/mp3"]

  validates :guardian_id, :description, presence: true
  validates_attachment :audio, :presence => true,
    :size => { in: 0..500.kilobytes }
  validates_attachment_content_type :audio, :content_type => ["audio/x-m4a", "audio/m4a", "audio/mp3"]



  def formatted_date
    self.date.strftime("%m/%d/%Y")
  end
end
