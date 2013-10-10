require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessible :email

  has_many :stories

  validates :email, uniqueness: true, presence: true, email: true

  def password=(password)
    if password.present?
      @real_password = password
      self.password_digest = BCrypt::Password.create(password)
    end
  end

  def password
    @real_password
  end

  def authenticate(unencrypted_password)
    if BCrypt::Password.new(password_digest) == unencrypted_password
      self
    else
      false
    end
  end

  def to_s
    email
  end
end
