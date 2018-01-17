FactoryBot.define do
	factory :event do
		name            { Faker::RockBand.name }
		description     { Faker::Hipster.sentence(3) }
		location        { Faker::LordOfTheRings.location }
		price           { Faker::Commerce.price}
		capacity        { Faker::Number.between(1,50) }
		includes_food   { Faker::Boolean.boolean }
		includes_drinks { Faker::Boolean.boolean }
		starts_at       { Faker::Date.between(2.days.ago, 2.days.from_now) }
		ends_at         { Faker::Date.between(2.days.ago, 2.days.from_now) }
		user            { build(:user) }

		trait :active do
			active true
		end

		trait :inactive do
			active false
		end
	end
end
