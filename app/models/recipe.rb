class Recipe < ApplicationRecord
    validates :name, :ingredients, :instructions, :cook_time, presence: true
    validates :name, uniqueness: true
    belongs_to :user
end
