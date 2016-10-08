class User < ApplicationRecord
  has_secure_password

  validates :first_name, :presence => true

  validates :last_name, :presence => true

  validates :email, :presence => true
  validates :email, :uniqueness => true

  validates :username, :presence => true
  validates :username, :uniqueness => true
  validates :username, :format => {
    :with => /\A[a-zA-Z0-9_-]+\z/,
    :message => "only allows letters, numbers, -, and _"
  }
  validates :username, :exclusion => {
    :in => %w(new edit),
    :message => "%{value} is reserved."
  }

  validates :password, :presence => true
  validates :password, :confirmation => true

  validates :password_confirmation, :presence => true

  validates :phone_number, :format => {
    :with => /\A[0-9]{10}\z/,
    :message => "must be exactly 10 digits"
  }

  validates :user_type, :presence => true

  before_validation :downcase_case_insensitive_attributes

  private
  def downcase_case_insensitive_attributes
    self.email.downcase!
    self.username.downcase!
  end
end
