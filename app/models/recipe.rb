class Recipe < ApplicationRecord
    validates :name, :ingredients, :instructions< :cook_time, presence: true
    validates :name, uniqueness: true
    belongs_to :user
    has_many :cookbooks
    has_many :users, through: :cookbooks
end
