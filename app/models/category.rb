class Category < ApplicationRecord
    validates :category, presence: true
    has_many :events, dependent: :destroy
end
