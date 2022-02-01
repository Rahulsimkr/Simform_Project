require "test_helper"

class FacultyTest < ActiveSupport::TestCase
  validates :first_name,:last_name, presence: true
  validates :phone_number, format: {with: /\A[0-9]{10}\z/ }
  validates :email, presence: true, uniqueness: true
    #validates_comparison_of :DOB, less_than: -> { Date.today }
  validates :designation, exclusion: { in: %w(HOD Sr.Prof.) },inclusion: { in: %w(Ass.Prof. Prof) ,
        message: "can't be %{value}" }
  # test "the truth" do
  #   assert true
  # end
end
