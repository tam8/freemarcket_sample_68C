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
    a_category               { FactoryBot.create(:a_category)}
    # a_categoryは後にcategoryに変更する
    user                     { FactoryBot.create(:user)}
    # a_category,userは通常item_spec.rbでのFactoryBotの記述で十分なはずですが、
    # それで上手くいかなかったため、キーにバリューを直接セットしています。
    buyer_id                 {"1"}
    after(:build) do |item|
      
      item.item_images << FactoryBot.build(:item_image, item: item)
    end

  end
end
