User.destroy_all

user1 = User.create!(email: 'felipe.menegossi@gmail.com', password: 'abc123')
user2 = User.create!(email: 'felipe@gmail.com', password: 'abc123')

Event.create!(
	name: "Just an poor event.",
	description: "That's just a description of this event.",
	price: 15,
	capacity: 10,
	starts_at: Time.now,
	ends_at: Time.now + 1.days,
	user: user1
)
