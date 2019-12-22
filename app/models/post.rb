class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :title, presence: true, length: {minimum: 2}
  validates :body, presence: true
end
