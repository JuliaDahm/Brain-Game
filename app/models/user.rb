class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :omniauthable, :omniauth_providers => [:facebook]
  has_many :questions
  accepts_nested_attributes_for :questions, allow_destroy: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid

      if user.provider == "facebook"
        user.email = "#{auth.info.nickname}@facebook.com"
      else
        user.email = auth.info.email
      end
      user.password = Devise.friendly_token[0,20]
    end
  end
end
