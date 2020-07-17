class User < ApplicationRecord
    
    has_secure_password
    has_many :posts
    has_many :recipes
    has_many :comments
    has_many :commented_posts, through: :comments, source: :post
    has_many :cookbooks
    has_many :saved_recipes, through: :cookbooks, source: :recipe

end
