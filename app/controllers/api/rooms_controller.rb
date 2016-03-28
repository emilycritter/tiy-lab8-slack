class Api::RoomsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :doorkeeper_authorize!

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find_by id: params[:id]
  end

  def create
  end

  def update
  end

  def destroy
  end
end
