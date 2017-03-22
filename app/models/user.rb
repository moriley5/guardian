class User < ApplicationRecord
  has_many :guardian_profiles

  validates :first_name, :last_name, :email, :password_digest, presence: true
  validates :email, uniqueness: true

  before_save :downcase_fields

  has_secure_password

  def downcase_fields
    self.first_name.downcase!
    self.last_name.downcase!
    self.email.downcase!
  end
end
