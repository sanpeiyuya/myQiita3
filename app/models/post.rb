class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user
  has_many :likes, dependent: :delete_all
  has_many :comments, dependent: :delete_all
end
