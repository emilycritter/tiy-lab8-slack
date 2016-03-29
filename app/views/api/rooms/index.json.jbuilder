json.rooms @rooms do |room|
  json.partial! 'room', room: room
end
json.meta do
  json.time Time.now
end
