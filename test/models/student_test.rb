require "test_helper"

class StudentTest < ActiveSupport::TestCase
  validates :first_name, :last_name , presence: true
  validates :department, inclusion: { in: %w(IT CE),
      message: "can't be %{value}" }
  validates :Terms_Of_Condition, acceptance: { message: 'must be abided' }
end
