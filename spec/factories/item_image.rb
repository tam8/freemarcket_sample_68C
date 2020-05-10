FactoryBot.define do
  factory :item_image do
    image  {File.open("#{Rails.root}/public/images/test_image.jpeg")}
    item
  end
end
