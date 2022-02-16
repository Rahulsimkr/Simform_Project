class UsersController < ApplicationController
  before_action :create_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice]="successfully signed up"
      redirect_to users_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end
  private
  
  def create_user
    @user = User.find_by_id(params[:id])
  end

  def user_params
    params.require(:user).permit(:username,:email,:password)
  end
end
