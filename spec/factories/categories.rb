FactoryBot.define do
  factory :category do
    id   { Faker::Number.within(range: 13..607)}
    name {"カジュアルパンツ"}
    ancestry {nil}
  end

end