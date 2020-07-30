class Post < ApplicationRecord
    
    belongs_to :user
    default_scope -> { order(created_at: :desc) }
    has_many :comments
    has_many :users, through: :comments
    validates :title, :content, presence: true
    validates :title, uniqueness: true
    validates :content, length: { maximum: 500}
end
