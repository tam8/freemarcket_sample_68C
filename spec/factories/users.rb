FactoryBot.define do
  factory :user do
    nickname               { Faker::Name.unique.name }
    password = Faker::Internet.password(min_length: 8)
    password               { password }
    password_confirmation  { password }
    email                  { Faker::Internet.email}
    first_name             { Faker::Name.first_name}
    last_name              { Faker::Name.last_name}
    first_name_kana        { "あああ" }
    last_name_kana         { "いいい"}
    birth_date             { Faker::Date.birthday}
  end
end
