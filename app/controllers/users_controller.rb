class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_back_or_default(root_path)
    else
      render :new
    end
  end

  def delete
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :photo)
  end
end