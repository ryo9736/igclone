class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites,dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: { maximum: 80 }
  validates :image, presence: true

  mount_uploader :image, ImageUploader
  paginates_per 1
end
