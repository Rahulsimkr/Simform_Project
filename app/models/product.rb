class Product < ApplicationRecord

    validates :price,:title,:description,:capacity,:status, presence: true
    enum :status, [:in_stock, :out_of_stock, :coming_soon]
    default_scope { where('is_active = ?', true)}
    has_many :order, dependent: :destroy
end
