class User < ApplicationRecord
    validates :email, :username, presence: true
    validates :email, :username, uniqueness: true
    validates :username, length: { minimum: 2}
    validates :password, length: { in: 6..15} 
    has_secure_password
    has_many :posts, dependent: :destroy
    has_many :recipes
    has_many :comments
    has_many :commented_posts, through: :comments, source: :post
    has_many :saved_recipes, through: :cookbooks, source: :recipe

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :omniauthable

    def self.from_omniauth(auth)
        where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
            user.provider = auth.provider
            user.uid = auth.uid
            user.email = auth.info.email

            if auth.info.username
                user.name = auth.info.username
            else
                user.name = auth.info.name
            end

            user.password = Devise.friendly_token[0,20]
         end 
    end
end