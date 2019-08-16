class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :email, presence: true, uniqueness: true
  
  devise :database_authenticatable, :registerable, :omniauthable, :omniauth_providers => [:google_oauth2]

  has_many :businesses

  def self.from_omniauth(auth)
    # Either create a User record or update it based on the provider (Google) and the UID   
    # where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user| #remove if fail
      user.token = auth.credentials.token
      user.provider = auth.provider
			user.uid = auth.uid
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.email = auth.info.email
      user.expires = auth.credentials.expires
      user.expires_at = auth.credentials.expires_at
      user.refresh_token = auth.credentials.refresh_token
      user.save! #remove if fail
    end
  end
       
end

# def self.find_or_create_from_auth_hash(auth)
#   where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
#     user.provider = auth.provider
#     user.uid = auth.uid
#     user.first_name = auth.info.first_name
#     user.last_name = auth.info.last_name
#     user.email = auth.info.email
#     user.picture = auth.info.image
#     user.save!
#   end
# end