class User < ApplicationRecord
  rolify
  has_secure_password
  validates :login, uniqueness: true
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :password, length: {minimum: 4, allow_nill: true}
  after_create :assign_default_role
  
  def assign_default_role
    self.add_role(:newuser) if self.roles.blank?
  end

  def password
    @password
  end

  def password=(raw)
    @password = raw
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password(password)
    BCrypt::Password.new(self.password_digest) == password
  end
end
