class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :password, :password_confirmation
  validates_presence_of :password, :on => :create

  has_many :stories

  def to_s
    self.email
  end
end
