FactoryBot.define do
  factory :user do
    nickname               { Faker::Name.unique.name }
    password = Faker::Internet.password(min_length: 8)
    password               { password }
    password_confirmation  { password }
    email                  { Faker::Internet.email}
  end
end
