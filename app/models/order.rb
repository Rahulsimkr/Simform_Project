class Order < ApplicationRecord
    validates :quantity, :status, presence: true
    belongs_to :customer 
    belongs_to :product
    enum :status, [:booked, :cancelled]
  
  
end
