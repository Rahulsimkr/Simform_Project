class Faculty < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true
    validates :birth_date, presence: true
    validates :phone_number, length: { is: 10 }, numericality: true
    validates :email, uniqueness: true
    validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, unless: Proc.new { |a| a.email.blank? }
    validate :desgination_of_faculty
    validates :birth_date, comparison: { less_than: Date.today, message: "can't be in future" }
    def desgination_of_faculty
      if (designation == "Ass. Prof" || designation == "Prof")
      elsif (designation == "HOD" || designation == "Sr. Prof.")
        errors.add(:designation, " must not be any from HOD and Sr. Prof.")
      else
        errors.add(:designation, "must  be any from Ass.Prof and Prof. ")
      end
    end
  end
  
  
