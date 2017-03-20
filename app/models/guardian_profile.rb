class GuardianProfile < ApplicationRecord
  has_many :memories, foreign_key: :guardian_id
  belongs_to :user

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }

  validates :user_id, :title, presence: true
  validates_attachment :image, :presence => true,
    styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
