class Customer < ApplicationRecord

    validates :fname, :lname, :email, :phone_number, presence: true
    validates :phone_number, length: {minimum:10, maximum:11}
    validates :email, uniqueness: true
    has_many  :orders, dependent: :destroy
end
