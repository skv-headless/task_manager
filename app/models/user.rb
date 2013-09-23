class User < ActiveRecord::Base
  has_secure_password

  has_many :stories

  attr_accessible :email, :password

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

  def to_s
    self.email
  end
end
