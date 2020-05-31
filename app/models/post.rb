class Post < ApplicationRecord
    belongs_to :category
    belongs_to :user
    has_many :comments
    validates :title, presence: true, length: {minimum: 5, maximum: 100}
    validates :description, presence: true, length: {minimum: 5, maximum: 100}
    validates :text, presence: true, length: {minimum: 5}

end
  