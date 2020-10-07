class Image < ApplicationRecord

	belongs_to :user
	belongs_to :category
	attachment :image
	has_many :comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :favorited_users, through: :favorites, source: :user
	geocoded_by :address
	after_validation :geocode, if: :address_changed?
	is_impressionable counter_cache: true
	default_scope -> { order(created_at: :desc) }

	validates :image, presence: true
	validates :title, presence: true
	validates :caption, presence: true
	validates :address, presence: true
		
	def favorited_by?(user)
	  favorites.where(user_id: user.id).exists?
	end

	def favorited_by?(admin)
	  favorites.where(user_id: user.id).exists?
	end

	def self.search(search)
		if search
			@images = Image.where("address LIKE ?", "%#{search}%")
		else
			Image.all
		end
	end
	
end
