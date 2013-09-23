class UserRegistrationType < User
  include ApplicationType

  attr_accessible :password_confirmation

  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true

  def email=(email)
    write_attribute(:email, email.mb_chars.downcase)
  end

end
