class Api::RoomsController < ApplicationController
  protect_from_forgery with: :null_session
  # before_action :doorkeeper_authorize!

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find_by id: params[:id]
    @posts = Post.where(room_id: @room.id)
  end

  def create
    @room = Room.new room_params
    if @room.save
      render :show
    else
      render json: @room.errors, status: 422
    end
  end

  def update
    @room = Room.find_by id: params[:id]
    if @room.update room_params
      render :show
    else
      render json: @room.errors, status: 422
    end
  end

  def destroy
    @room = Room.find_by id: params[:id]
    @room.destroy
    head :ok
  end

  def add_post
    @room = Room.find_by id: params[:id]
    @post = Post.new
    @post.member = Member.where(room_id: @room.id).find_by(user_id: current_user.id)
    @post.post_content = params[:post_content]
    if @post.save
      render :show
    else
      render json: @post.errors, status: 422
    end
  end

  def delete_post
    @room = Room.find_by id: params[:id]
    @post = Post.find_by id: params[:id]
    if @post.member.user == current_user
      @post.destroy
      head :ok
    end
  end

  def add_user
    @room = Room.find_by id: params[:id]
    @member = Member.new
    @member.user_id = current_user.id
    @member.room_id = @room.id
    if @member.save
      render :show
    else
      render json: @member.errors, status: 422
    end
  end

  def delete_user
    @room = Room.find_by id: params[:id]
    @member = Member.where(room_id: @room.id).find_by(user_id: current_user.id)
    @member.destroy
    render :show
  end

  private

  def current_user
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end

  def room_params
    params.require(:room).permit(:name, :description)
  end

end
