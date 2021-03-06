class User < ActiveRecord::Base
  attr_accessible :name, :email, :password_digest,
  :password, :password_confirmation
  before_save { email.downcase! }
  validates :name, 
  			presence: true,
  			length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, 
  			presence: true,
  			format: { with: VALID_EMAIL_REGEX },
  			uniqueness: { case_sensitive: false}
  has_secure_password
  validates :password,
        length: { minimum: 6}
end