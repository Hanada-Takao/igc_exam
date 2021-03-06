class User < ApplicationRecord
    before_save { self.email = self.email.downcase }
    validates :name,  presence: true,
                        length: { maximum: 30 }
    validates :email, presence: true,
                        length: { maximum: 255 },
                        format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
    has_many :blogs
    has_many :favorites, dependent: :destroy
    has_many :microposts, dependent: :destroy
    mount_uploader :photo, ImageUploader
end
