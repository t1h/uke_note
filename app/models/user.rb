class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:twitter]

  has_many :chords, :dependent => :delete_all
  has_many :chord_settings, :dependent => :delete_all
  accepts_nested_attributes_for :chords, :chord_settings

  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider= auth.provider
      user.uid = auth.uid
      user.email = auth.uid + '@oauth_dummy.twitter.com' # 登録にemail必須のため
      user.password = Devise.friendly_token[0,20]
    end
  end
end
