class GuardianProfile < ApplicationRecord
  has_many :memories, foreign_key: :guardian_id
  belongs_to :user

  validates :user_id, :title, :image, presence: true
end
