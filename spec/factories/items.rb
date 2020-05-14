FactoryBot.define do
  factory :item do
    name                     {"test"}
    price                    {"300"}
    status_id                { Status.all.sample }
    brand                    {"シャネル"}
    shipping_fee_id          { ShippingFee.all.sample}
    shipping_method_id       { ShippingMethod.all.sample}
    owners_area_id           { OwnersArea.all.sample}
    arrival_date_id          { ArrivalDate.all.sample}
    explain                  {"これはいいテストです。"}
    a_category_id            { FactoryBot.create(:a_category)}
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
