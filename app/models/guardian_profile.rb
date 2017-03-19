class GuardianProfile < ApplicationRecord
  has_many :memories, foreign_key: :guardian_id
  belongs_to :user

  validates :user_id, :title, presence: true
  validates_attachment :image, :presence => true,
    :content_type => {:content_type => "image/jpeg" },
    :size => { in: 0..500.kilobytes }
end
