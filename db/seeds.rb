Category.destroy_all
Photo.destroy_all
Event.destroy_all
Profile.destroy_all
User.destroy_all

# Users
user1 = User.create!(email: 'felipe.menegossi@gmail.com', password: 'abcd1234')
user2 = User.create!(email: 'felipe@gmail.com', password: 'abcd1234')
miriam = User.create(email: "miriam@codaisseurup.com", password: "abcd1234")

# Events
event1 = Event.create!(name: "Just an poor event.", description: "That's just a description of this event.",
				   price: 15, capacity: 10, starts_at: Time.now,	ends_at: Time.now + 2.days,	user: user1)
event2 = Event.create!(name: "Test event 2", description: "Craziest event you ever know.",
				   price: 15, capacity: 10, starts_at: Time.now,	ends_at: Time.now + 6.days,	user: user2)
event3 = Event.create!(name: "Just testing events", description: "It isn't an event!",
				   price: 15, capacity: 10, starts_at: Time.now,	ends_at: Time.now + 4.days,	user: user1)

# Categories
Category.create!([{name:"+18 Only"},{name:"Matine"},{name:"Pizza"},{name:"Happy Hour"},])

# Photos
photo1 = Photo.create!(remote_image_url: "http://res.cloudinary.com/fmenegossi/image/upload/v1516274323/kevin-364843_fpfspl.jpg", event: event1)
photo2 = Photo.create!(remote_image_url: "http://res.cloudinary.com/fmenegossi/image/upload/v1516274323/ilya-pavlov-87438_ld37au.jpg", event: event1)
photo3 = Photo.create!(remote_image_url: "http://res.cloudinary.com/fmenegossi/image/upload/v1516274323/kevin-364843_fpfspl.jpg", event: event1)

photo4 = Photo.create!(remote_image_url: "http://res.cloudinary.com/fmenegossi/image/upload/v1516274323/ilya-pavlov-87438_ld37au.jpg", event: event2)
photo5 = Photo.create!(remote_image_url: "http://res.cloudinary.com/fmenegossi/image/upload/v1516274323/kevin-364843_fpfspl.jpg", event: event2)
photo6 = Photo.create!(remote_image_url: "http://res.cloudinary.com/fmenegossi/image/upload/v1516274323/ilya-pavlov-87438_ld37au.jpg", event: event2)

photo7 = Photo.create!(remote_image_url: "http://res.cloudinary.com/fmenegossi/image/upload/v1516274323/ilya-pavlov-87438_ld37au.jpg", event: event3)
photo8 = Photo.create!(remote_image_url: "http://res.cloudinary.com/fmenegossi/image/upload/v1516274323/ilya-pavlov-87438_ld37au.jpg", event: event3)
photo9 = Photo.create!(remote_image_url: "http://res.cloudinary.com/fmenegossi/image/upload/v1516274323/kevin-364843_fpfspl.jpg", event: event3)
