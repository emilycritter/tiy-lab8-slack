class Api::RoomsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :doorkeeper_authorize!

  
end
