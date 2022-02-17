class Category < ApplicationRecord
    validates :category_name, presence: true
    has_many :events, dependent: :destroy
end
