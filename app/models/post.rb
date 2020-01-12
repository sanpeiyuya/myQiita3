class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user
  has_many :likes, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  has_many :posts_tags,dependent: :destroy
  has_many :tags, through: :posts_tags

  # delegate :username, to: :user

  def self.tagged_with(name)
    Tag.find_by!(name: name).posts
    
  end

  def all_tags=(names)
    self.tags=names.split(',').map do |name|
      Tag.where(name: name).first_or_create!
    end
  end

  def all_tags
    tags.map(&:name).join(", ")
  end
  
end
