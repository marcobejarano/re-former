class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
      flash[:success] = "Great! You created a new user!!"
    else
      flash.now[:alert] = "Ups! Fix up your mistake, please."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      redirect_to @user
      flash[:success] = "Great! The user was updated successfully."
    else
      flash.now[:alert] = "Ups! Fix up your mistake, please."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, status: 303
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
