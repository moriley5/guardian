class Memory < ApplicationRecord
  belongs_to :guardian_profile, foreign_key: :guardian_id

  has_attached_file :audio

  validates :guardian_id, :description, presence: true
  validates_attachment :audio, :presence => true,
    :content_type => {:content_type => "audio/x-m4a" },
    :size => { in: 0..500.kilobytes }



  def formatted_date
    self.date.strftime("%m/%d/%Y")
  end
end
