class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :posts
  has_many :favorites,dependent:destroy
  validates :name, presence: true,length: { maximum: 20 }
  validates :email, presence: true,length:{ maximum: 40 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
end
