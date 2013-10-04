class User < ActiveRecord::Base
  attr_accessible :email, :password

  has_many :stories

  validates :email, uniqueness: true, presence: true, email: true

  has_secure_password

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
