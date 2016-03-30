require 'open-uri'

class Api::UsersController < ApplicationController
  protect_from_forgery with: :null_session

  def show
    @user = User.find_by id: @current_user.id
  end

  def create
    @user = User.new user_params

    url = params[:user][:photo_url]
    if url.present?
      open(url, "rb") do |file|
        @user.photo = file
      end
    end

    if @user.save
      render :show
    else
      render json: @user.errors, status: 422
    end
  end

  def update
    @user = User.find_by id: @current_user.id

    url = params[:user][:photo_url]
    if url.present?
      open(url, "rb") do |file|
        @user.photo = file
      end
    end

    if @user.update user_params
      render :show
    else
      render json: @user.errors, status: 422
    end
  end

  def delete
    @user = User.find_by id: @current_user.id
    @user.destroy
    head :ok
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :photo)
  end

end
