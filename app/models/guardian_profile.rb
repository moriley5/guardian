class GuardianProfile < ApplicationRecord
  has_many :memories, foreign_key: :guardian_id
  belongs_to :user

  has_attached_file :image, styles: { medium: "150x150>", thumb: "75x75>" }

  validates :user_id, :title, presence: true
  validates_attachment :image, :presence => true,
    styles: { medium: "150x150>", thumb: "75x75>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
