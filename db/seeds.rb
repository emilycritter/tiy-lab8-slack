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
  room.user_id = 3
  room.save

  room = Room.new
  room.name = "hou_feb2016"
  room.user_id = 3
  room.save

  room = Room.new
  room.name = "hou_feb2016_rails"
  room.description = "The most interesting class in the world"
  room.user_id = 3
  room.save
end

if Member.count == 0
  Member.create! user_id: 1, room_id: 1
  Member.create! user_id: 2, room_id: 1
  Member.create! user_id: 3, room_id: 1

  Member.create! user_id: 1, room_id: 1
  Member.create! user_id: 2, room_id: 1
  Member.create! user_id: 3, room_id: 1

  Member.create! user_id: 2, room_id: 1
  Member.create! user_id: 3, room_id: 1
end

if Post.count == 0
  Post.create! user_id: 3, room_id: 1, post_content: "Welcome H-Town!"
  Post.create! user_id: 2, room_id: 1, post_content: "I'm the campus operations manager for Houston. Reach out if you have any questions"
  Post.create! user_id: 1, room_id: 1, post_content: "Thanks @dorton and @christieloyd. So happy to be here!"

  Post.create! user_id: 3, room_id: 2, post_content: "We start on Feb. 1 with breakfast at 9am. Gently Reminded."
  Post.create! user_id: 2, room_id: 2, post_content: "We have donuts!!"

  Post.create! user_id: 1, room_id: 3, post_content: "Roooooby 4lyfe"
end
