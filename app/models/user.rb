class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :omniauthable, :omniauth_providers => [:facebook]
  has_many :questions
  accepts_nested_attributes_for :questions, allow_destroy: true

  def self.from_omniauth(facebook_info)
    where(provider: facebook_info.provider, uid: facebook_info.uid).first_or_create do |user|
      user.email = facebook_info.info.email
      user.password = Devise.friendly_token
      user.name = facebook_info.info.name
    end
  end
end
