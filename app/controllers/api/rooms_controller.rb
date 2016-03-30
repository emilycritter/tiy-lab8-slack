class Api::RoomsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find_by(id: params[:id])
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

    @post.user = @current_user

    @post.room = @room
    @post.post_content = params[:post][:post_content]

    @post.member = Member.find_by(room_id: @room.id, user_id: @current_user.id)


    if @post.save
      render :show
    else
      render json: @post.errors, status: 422
    end
  end

  def delete_post
    @room = Room.find_by id: params[:id]
    @post = Post.find_by id: params[:id]
    if @post.member.user == @current_user
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
    @member = Member.find_by(room_id: @room.id, user_id: @current_user.id)
    @member.destroy
    render :show
  end

  private

  def room_params
    params.require(:room).permit(:name, :description)
  end

end
