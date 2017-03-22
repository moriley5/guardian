class Note < ApplicationRecord

  belongs_to :guardian_profile, foreign_key: :guardian_id

  validates :title, presence: true

end
