class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :dislikes, dependent: :destroy

  validates :title, presence: true, length: {minimum: 6}
  validates :body, presence: true
end
