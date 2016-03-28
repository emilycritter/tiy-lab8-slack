class RoomsController < ApplicationController
  before_action do
    @current_user = User.find_by id: session[:user_id]
    if @current_user.blank?
      store_location
      redirect_to sign_in_path
    end
  end

  def show
    @room = Room.find_by name: params[:name]
    @members = Member.where room_id: @room.id
    all_member_ids = @room.members.pluck(:id)
    @posts = Post.where member_id: all_member_ids
  end
end
