class UsersController < ApplicationController
  def index
    @user = User.find_by(id: session[:user_id])
  end

  def new
  end

  def create
    user = User.new(user_params)
    # byebug
    if user.save
      session[:user_id] = user[:id]
      redirect_to users_path
    else
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
