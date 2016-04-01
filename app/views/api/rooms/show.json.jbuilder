json.room do
  json.partial! 'room', room: @room
end
json.meta do
  json.time Time.now
  json.current_user @current_user if @current_user.present?
end
