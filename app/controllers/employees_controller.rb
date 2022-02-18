class EmployeesController < ApplicationController
  before_action :find_employee, only: %i[show edit update destroy]

  def index
    @employees = Employee.all
  end

  def show
  end

  def edit
  end

  def new
    @employee = Employee.new
    1.times { @employee.emp_addresses.build }
  end

  def create 
    employee = Employee.create(employee_params)
    if employee.save!
      flash[:notice] = "Employee has been added successfully."
      redirect_to employees_path
    else 
      flash[:errors] = employee.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end 

  def edit
    # @employee =Employee.find(params[:id])
  end 

  def update 
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      flash[:notice] = "Employee is successfully updated ."
      redirect_to employees_path
    else
      flash[:errors] = @employee.errors.full_messages 
      render :new, status: :unprocessable_entity
    end
  end

  def destroy 
    @employee.destroy
    
    flash[:notice] = "Employee has been deleted successfully"
    redirect_to employee_path
  end

  def search
    if params[:query]
      redirect_to search_path if Employee.find(params[:query]).blank?
      redirect_to employee_path(params[:query])
    end
  end

  private 

  def employee_params
    params.require(:employee).permit(:employee_name, :email, :password, :birth_date, :document,
    {hobbies:[]}, :gender, :mobile_number, :address, emp_addresses_attributes: [:quarter_number, :sector, :street_name,
    :city, :state ])
  end

  def find_employee
    @employee = Employee.find_by(id: params[:id])
  end
end
