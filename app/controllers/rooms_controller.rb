class RoomsController < ApplicationController
  before_action do
    @current_user = User.find_by id: session[:user_id]
    if @current_user.blank?
      store_location
      redirect_to sign_in_path
    end
  end

  def index
    @rooms = Room.all.order("name asc")
  end

  def show
    @room = Room.find_by name: params[:name]
    @members = Member.where(room_id: @room.id).order("name asc")
    all_member_ids = @room.members.pluck(:id)
    @posts = Post.where(member_id: all_member_ids).order("created_at desc")
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new room_params
    if @room.save
      member = Member.new
      member.room_id = @room.id
      member.user_id = @current_user.id
      member.creator_boolean = true
      member.save
      redirect_to rooms_path
    else
      render :new
    end
  end

  def room_params
    params.require(:room).permit(:name, :description)
  end

  def join_room
    @room = Room.find_by id: params[:id]
    member = Member.new
    member.user = @current_user
    member.room = @room

    if member.save
      redirect_to rooms_path
    else
      redirect_to rooms_path
    end
  end

  def leave_room
    @room = Room.find_by id: params[:id]
    member = Member.find_by(room_id: @room.id, user_id: @current_user.id)
    member.destroy
    redirect_to rooms_path
  end

end
