class DestroyCallback
  def after_destroy(obj)
		puts "object destroyed successfully"
	end
end

class Student < ApplicationRecord
  validates :first_name, :last_name , presence: true
	validates :department, inclusion: { in: %w(IT CE), message: "can't be %{value}" }
	validates :Terms_Of_Condition, acceptance: { message: 'must be abided' }
	Date.today
	validates :birth_date,comparison: {less_than_or_equal_to: Date.today,message:"birthday can't be in future"}
	before_create :greeting_message
	    def greeting_message
		   puts"Hey! i will run before you create an object"
	    end 	

  after_create :display_student_age 
    def display_student_age
      if self.birth_date.present?
				age = Date.today.year - self.birth_date.year 
				puts"==========Age of student is #{age}============="
			else
				puts"=======Age can not be calculated without DOB========"
		  end    
    end

	after_destroy DestroyCallback.new , if: after_destroy_commit

	#ater_initialize callback
	after_initialize do |student|
		puts "Student object has been initialized"
	end

	#after_find callback will be called whenever active record loads the data
	after_find do |student|
		puts "Student Object has been found"
	end

	#after_create callback
	after_create do |student|
		puts "Student object has been created"
	end
  
	#after_update callback
	after_update do |student|
		puts "Student object updated"
	end

	#after_destroy callback (It will only be run when you use destroy)
	after_destroy do |student|
		puts "Student object has been destroyed"
	end

	after_save do |student|
		puts "DOB is validated"
	end

	private
		def check_DOB
			puts "Date Of Birth is : #{self.birth_date}"
		end
end

