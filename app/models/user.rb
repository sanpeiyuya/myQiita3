class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :name , presence: true
  validates :nickname, presence: true
  validates :password, presence: true
  
  has_many :posts, dependent: :delete_all
  has_many :likes, dependent: :delete_all
  has_many :comments

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
end
