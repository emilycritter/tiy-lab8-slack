json.user do
  json.id @user.id
  json.name @user.name
  json.email @user.email
  json.photo @user.photo
  if @user.rooms
    json.rooms @user.rooms do |room|
      json.room_id room.id
      json.room_name room.name
      json.room_description room.description
      json.room_member_count room.members.count
    end
  end
end
