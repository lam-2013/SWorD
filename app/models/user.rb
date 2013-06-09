# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  remember_token  :string(255)
#  admin           :boolean          default(FALSE)
#  twitter_uid     :string(255)
#  facebook_uid    :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :twitter_uid, :facebook_uid

  # basically, the method realizes the authentication system
  has_secure_password

  # put the email in downcase before saving the user
  before_save { |user| user.email = email.downcase }
  # call the create_remember_token private method before saving the user
  before_save :create_remember_token

  # name must be always present and with a maximum length of 50 chars
  validates :name, presence: true, length: { maximum: 50 };

  # email allowed format representation (expressed as a regex)
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+.[a-z]+\z/i

  # email must be always present, unique and with a specific format
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  # password must be always present, and with a minimum length of 6 chars
  validates :password, presence: true, length: { minimum: 6 }

  # password_confirmation must be always present
  validates :password_confirmation, presence: true

  # create user from oauth data
  def self.create_with_omniauth(auth)
    create! do |user|
      if auth[:provider] == 'twitter'
        user.twitter_uid = auth[:uid]
        user.name = auth[:info][:name]
        # compose a fake email, since twitter does not provide this information
        user.email = "#{auth[:info][:nickname]}@twitter.com"
      elsif auth[:provider] == 'facebook'
        user.facebook_uid = auth[:credentials][:token]
        user.name = auth[:info][:name]
        user.email = auth[:info][:email]
      end
      # generate a random password
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
    end
  end

  # private methods
  private

    def create_remember_token
      # create a random string, safe for use in URIs and cookies, for the user remember token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end
