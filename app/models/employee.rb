class Employee < ApplicationRecord
  validates :employee_name, :email, :password, :address, :gender, :hobbies, :birth_date, presence: true
  validates :email, uniqueness: true
  validates :employee_name, length: { minimum: 2, maximum: 20 }
  validates :address, length: { minimum: 10, maximum: 100 }
  has_many :emp_addresses, dependent: :destroy
  accepts_nested_attributes_for :emp_addresses
end
