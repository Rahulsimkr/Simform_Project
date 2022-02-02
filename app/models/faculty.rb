class Faculty < ApplicationRecord
  validates :first_name,:last_name, presence: true
  validates :phone_number, format: {with: /\A[0-9]{10}\z/ }
  validates :email, presence: true, uniqueness: true

	after_validation do 
		faculty.errors.add_to_email("Country can't be blank") if faculty.email.blank?
  end
  validates :designation, exclusion: { in: %w(HOD Sr.Prof.) },inclusion: { in: %w(Ass.Prof. Prof) ,
      message: "can't be %{value}" }
  Date.today
  validates :birth_date,comparison: {less_than_or_equal_to: Date.today,message:"birthday can't be in future"}
  after_validation :check_birth_date

  #ater_initialize callback
  after_initialize do 
      puts "Faculty object initialized"
  end

  #after_find callback will be called whenever active record loads the data
  after_find do 
      puts "Faculty Object found"
  end

  #after_create callback
  after_create do 
      puts "Faculty object created"
  end

  #after_update callback
  after_update do |faculty|
      puts "Faculty object updated"
  end

  #after_destroy callback (It will only be run when you use destroy)
  after_destroy do |faculty|
      puts "Faculty object destroyed"
  end

  private
    def check_birth_date
        puts "Date Of Birth is : #{self.birth_date}"
    end
end
