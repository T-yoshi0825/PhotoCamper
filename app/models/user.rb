class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook twitter google_oauth2]
         
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  enum is_active: {Available: true, Invalid: false}
  #有効会員はtrue、退会済み会員はfalse

  def active_for_authentication?
      super && (self.is_active === "Available")
  end
  #is_activeが有効の場合は有効会員(ログイン可能)

  has_many :images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_images, through: :favorites, source: :image
  attachment :profile_image
  
  validates :name, presence: true
  validates :email, presence: true
end
