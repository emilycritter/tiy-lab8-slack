json.id room.id
json.name room.name
json.description room.description
json.created_at room.created_at
json.updated_at room.updated_at
if room.posts
  json.post_count room.posts.count
  json.posts room.posts do |post|
    json.id post.id
    json.content post.post_content
    json.user_id post.member.user.id
    json.user_name post.member.user.name
    json.created_at post.created_at
    json.updated_at post.updated_at
  end
end
if room.members
  json.member_count room.members.count
  json.members room.members do |member|
    json.id member.id
    json.user_id member.user_id
    json.user_name member.user.name
    json.creator_boolean member.creator_boolean
  end
end
