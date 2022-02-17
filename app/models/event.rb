class Event < ApplicationRecord
    validates :name, :description, :event_date, presence:true 
    validates :description, length: {minimum:10, maximum:300}
    validates :name, length: {minimum:2, maximum:50}
    belongs_to :user
    belongs_to :category
    has_many :enrollments 
    has_many :enroll_events, through: :enrollments, source: :user
end
