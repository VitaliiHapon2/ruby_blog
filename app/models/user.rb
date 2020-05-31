class User < ApplicationRecord
    validates :username, presence: true, length: {minimum: 3, maximum: 20} 
    validates :password, presence: true, length: {minimum: 3, maximum: 20}
    has_many :posts, dependent: :destroy

    attr_accessor :confirm
end