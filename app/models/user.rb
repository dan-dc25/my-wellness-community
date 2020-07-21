class User < ApplicationRecord
    validates :email, :username, presence: true
    validates :email, :username, uniqueness: true
    validates :username, length: { minimum: 2}
    validates :password, length: { in: 6..15} 
    has_secure_password
    has_many :posts
    has_many :recipes
    has_many :comments
    has_many :commented_posts, through: :comments, source: :post
    has_many :saved_recipes, through: :cookbooks, source: :recipe
end
