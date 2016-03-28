json.user do
  json.id @user.id
  json.name @user.name
  json.email @user.email
  if @user.members
    json.rooms @user.members do |member|
      json.room_id member.room.id
      json.room_name member.room.name
      json.room_description member.room.description
      json.room_member_count member.room.count
    end
  end
end
