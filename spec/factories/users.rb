FactoryBot.define do
  factory :user do
    # nickname               {"aaaaaa"}
    # password               {"000000"}
    # password_confirmation  {"000000"}
    # email                  {"kkk@gmail.com"}
    nickname               { Faker::Name.unique.name }
    password = Faker::Internet.password(min_length: 8)
    password               { password }
    password_confirmation  { password }
    email                  { Faker::Internet.email}
  end
end
