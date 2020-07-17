class Recipe < ApplicationRecord
  belongs_to :user
  has_one :category
  has_many :cookbooks
  has_many :users, through: :cookbooks
end
