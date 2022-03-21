class User < ApplicationRecord
  rolify
  has_secure_password

  validates :email, uniqueness: true
  validates :email, presence: true
  validates :password, length: {minimum: 4, allow_nill: true}

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
