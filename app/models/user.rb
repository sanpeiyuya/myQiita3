class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :name , presence: true
  validates :nickname, presence: true
  
  has_many:posts, dependent: :delete_all
end
