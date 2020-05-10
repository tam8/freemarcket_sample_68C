FactoryBot.define do
  factory :item do
    name                     {"test"}
    price                    {"300"}
    status                   { Status.all.sample }
    brand                    {"シャネル"}
    shipping_fee             { ShippingFee.all.sample}
    shipping_method          { ShippingMethod.all.sample}
    owners_area              { OwnersArea.all.sample}
    arrival_date             { ArrivalDate.all.sample}
    explain                  {"これはいいテストです。"}
    a_category               
    # a_categoryは後にcategoryに変更する
    user
    buyer_id                 {"1"}
    after(:build) do |item|
      item.item_images << build(:item_image, item: item)
    end
  end
end
