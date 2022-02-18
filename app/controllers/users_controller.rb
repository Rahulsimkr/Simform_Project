class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    # binding.pry
  end

  def new
    @user = User.new
  end

  def create
    # binding.pry
    @user = User.new(user_params)
    if @user.save
      flash[:notice]="Welcome to the Event Blog #{@user.username}, you have successfully signed up !!"
      redirect_to users_path
    else
      flash[:alert] = "Something was wrong"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    flash[:notice]="successfully deleted"
    redirect_to users_path
  end

  def register_event
    @user = User.find_by(id: session[:user_id])
    @enrollment = @user.enrollments.create()
  end

  private
  
  def find_user
    @user = User.find_by_id(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
