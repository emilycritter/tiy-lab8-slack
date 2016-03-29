json.room do
  json.partial! 'room', room: @room
end
json.meta do
  json.time Time.now
end
