class User < ApplicationRecord
  attr_accessor :login
    validates :email, :name, presence: true
    validates :email, uniqueness: true
    validates :name, length: { minimum: 2}
    validates :password, length: { in: 6..20} 
    has_many :posts, dependent: :destroy
    has_many :recipes
    has_many :comments, through: :posts

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :omniauthable
    
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

    def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
        user.name = auth.info.name   # assuming the user model has a name
        # If you are using confirmable and the provider(s) you use validate emails, 
        # uncomment the line below to skip the confirmation emails.
        # user.skip_confirmation!
      end
    end


    
end
