class Image < ApplicationRecord

	belongs_to :user
	belongs_to :category
	attachment :image
	has_many :comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	geocoded_by :address
	after_validation :geocode, if: :address_changed?

	def favorited_by?(user)
	  favorites.where(user_id: user.id).exists?
	end

	def self.search(search)
		if search
			Image.where(['content LIKE ?', "%#{search}%"])
		else
			Image.all
		end
	end
	 
end
