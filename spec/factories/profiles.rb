FactoryBot.define do
  factory :profile do
    first_name  { Faker::Name.first_name }
    last_name   { Faker::Name.last_name }
    bio         { Faker::Hipster.paragraph(2) }
  end
end
