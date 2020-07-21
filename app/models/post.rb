class Post < ApplicationRecord
    validates :title, :content, presence: true
    validates :title, uniqueness: true
    validates :content, length: { maximum: 500}
    belongs_to :user
    has_many :comments
    has_many :users, through: :comments
end
