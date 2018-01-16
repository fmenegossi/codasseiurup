User.destroy_all
Category.destroy_all

user1 = User.create!(email: 'felipe.menegossi@gmail.com', password: 'abc123')
user2 = User.create!(email: 'felipe@gmail.com', password: 'abc123')
miriam = User.create(email: "miriam@codaisseurup.com", password: "abcd1234")

Event.create!(
	name: "Just an poor event.",
	description: "That's just a description of this event.",
	price: 15,
	capacity: 10,
	starts_at: Time.now,
	ends_at: Time.now + 1.days,
	user: user1
)


Event.create!(name: "Monthly Yoga Weekend", description: "Let's come together and practice some asanas together in the woods!", location: "Amsterdam", includes_food: false, includes_drinks: true, price: 10.00, starts_at: 10.days.from_now, ends_at: 12.days.from_now, capacity: 100, active: true,  user: miriam)

Category.create!([{name:"+18 Only"},{name:"Matine"},{name:"Pizza"},{name:"Happy Hour"},])
