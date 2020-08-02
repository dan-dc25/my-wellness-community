class Comment < ApplicationRecord
    belongs_to :post
    validates :content, length: { maximum: 100}
end
