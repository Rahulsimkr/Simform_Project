class EmployeesController < ApplicationController
  before_action :create_employee, only: [:show, :edit, :update, :destroy]
  def index
    @employees=Employee.all
      # @employees=Employee.where.not(last_name: "person").limit(1)
      if params[:search]
        if Employee.find_by("email = ?",params[:search])
          flash[:notice]="Email is present"
          redirect_to employees_path
        else
          flash[:notice]="Email is not present"
        
        end
      end
  end

  def save 
    puts :email
  end
  def show
    @employee = Employee.find_by_id(params[:id])
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.find_or_create_by(employee_params)
    if @employee.valid?
      flash[:notice] = "Employee created sucessfully"
      redirect_to employees_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @employee.update(employee_params)
     
      flash[:notice] = "Employee Updated sucessfully"
      redirect_to employees_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @employee.destroy
    redirect_to employees_path
  end

  def display
    @employee_age_bewteen_twenty_and_fourty = Employee.where("age > 20").and(Employee.where("age < 40"))
    @employee_full_time_available = Employee.where("full_time_available=true")
    @employee_having_no_of_order_five = Employee.where("no_of_order=5").and(Employee.where("age > 25"))
    @employee_created_one_day_ago = Employee.where("created_at < ?", 1.days.ago)
    @employee_order_no_five_and_age_less_than_twentyfive = Employee.where("no_of_order=5").or(Employee.where("age < 25"))
    @employee_age_in_descending_order = Employee.order("age desc")
    @employee_NoOfOrder_in_descending_order = Employee.order("no_of_order asc")
    @employee_salary_greater_than_fourtyfive = Employee.where("salary > 45000")
    @employee_NoOfOrder_greater_than_five = Employee.where("no_of_order > 5").group(:no_of_order)
    @employee_limit_five_NoOfOrder = Employee.where("no_of_order > 5").limit(5).unscope(:limit)
    @employee_limit_five = Employee.where("no_of_order > 5").limit(5).only(:where)
    @employee_select_firstname_only = Employee.select(:first_name).reselect(:email)
    @employee_reverse_descending_order = Employee.order("age desc").reverse_order
    @employee_reorder = Employee.order("age desc").reorder("age asc")
  end
  
  private
  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :email, :age, :no_of_order, :full_time_available, :salary)
  end

  def create_employee
    @employee = Employee.find_by(id:params[:id])
  end
end
