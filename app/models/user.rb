class User < ApplicationRecord
  has_secure_password
  has_many :snippets, dependent: :nullify

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false },
                  format: VALID_EMAIL_REGEX

  def full_name
    "#{self.first_name} #{self.last_name}".titlecase
  end

  private
  def downcase_email
    self.email.downcase! if email.present?
  end

end
