if User.count == 0
  user = User.new
  user.name = "bob"
  user.email= "bob@example.com"
  user.password = "12345678"
  File.open("#{Rails.root}/app/assets/images/default_profile_photo.png", "rb") do |file|
    user.photo = file
  end
  user.save

  user = User.new
  user.name = "christieloyd"
  user.email = "sally@example.com"
  user.password = "12345678"
  File.open("#{Rails.root}/app/assets/images/default_profile_photo.png", "rb") do |file|
    user.photo = file
  end
  user.save

  user = User.new
  user.name = "dorton"
  user.email = "dorton@example.com"
  user.password = "12345678"
  File.open("#{Rails.root}/app/assets/images/default_profile_photo.png", "rb") do |file|
    user.photo = file
  end
  user.save
end

if Room.count == 0
  room = Room.new
  room.name = "hou_global"
  room.description = "All things H-Town"
  room.save

  room = Room.new
  room.name = "hou_feb2016"
  room.save

  room = Room.new
  room.name = "hou_feb2016_rails"
  room.description = "The most interesting class in the world"
  room.save

  room = Room.new
  room.name = "hou_random"
  room.description = "So many posts, this room isn't worth joining"
  room.save
end

if Member.count == 0
  Member.create! user_id: 1, room_id: 1
  Member.create! user_id: 2, room_id: 1
  Member.create! user_id: 3, room_id: 1, creator_boolean: true

  Member.create! user_id: 1, room_id: 2
  Member.create! user_id: 2, room_id: 2
  Member.create! user_id: 3, room_id: 2, creator_boolean: true

  Member.create! user_id: 1, room_id: 3
  Member.create! user_id: 3, room_id: 3, creator_boolean: true

  Member.create! user_id: 1, room_id: 4, creator_boolean: true
end

if Post.count == 0
  Post.create! post_content: "Welcome H-Town!", member_id: 3
  Post.create! post_content: "I'm the campus operations manager for Houston. Reach out if you have any questions", member_id: 2
  Post.create! post_content: "Thanks @dorton and @christieloyd. So happy to be here!", member_id: 1

  Post.create! post_content: "We start on Feb. 1 with breakfast at 9am. Gently Reminded.", member_id: 6
  Post.create! post_content: "We have donuts!!", member_id: 5
  Post.create! post_content: "![alt text](http://media4.popsugar-assets.com/files/2014/08/08/878/n/1922507/caef16ec354ca23b_thumb_temp_cover_file32304521407524949.xxxlarge/i/Funny-Cat-GIFs.jpg)", member_id: 4
  Post.create! post_content: "I hate donuts", member_id: 4
  Post.create! post_content: "Who invited Bob?", member_id: 6

  Post.create! post_content: "Roooooby 4lyfe. `best_language= 'ruby'`", member_id: 7

  Post.create! post_content: "First post in this nonsense room", member_id: 9
  150.times do
    Post.create! post_content: "Roooooby 4lyfe. `best_language= 'ruby'`", member_id: 9
  end
  Post.create! post_content: "Last post in this nonsense room", member_id: 9
end
