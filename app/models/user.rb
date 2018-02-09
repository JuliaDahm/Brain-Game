class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :omniauthable, :omniauth_providers => [:facebook]


  def self.from_omniauth(facebook_info)
    where(provider: facebook_info.provider, uid: facebook_info.uid).first_or_create do |user|
      user.email = facebook_info.info.email
      user.password = Devise.friendly_token
      user.name = facebook_info.info.name
    end
  end

  # after_create :create_profile
 validates_presence_of :email
 validates_presence_of :name, :if => :no_username?
 validates_presence_of :password

  def no_username?
    :username == nil
  end
end
