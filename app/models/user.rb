class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_uniqueness_of :auth_token

  def info
    "#{email} - #{created_at} - token: #{Devise.friendly_token}"
  end

  def generate_authentication_token!
    self.auth_token = Devise.friendly_token
  end while User.exists?(auth_token: auth_token)
    
  end
end
