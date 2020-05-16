FactoryBot.define do
  factory :item do
    name                     {"test"}
    price                    {"300"}
    brand                    {"シャネル"}
    explain                  {"これはいいテストです。"}
    status_id                { "1"}
    shipping_fee_id          { "1"}
    shipping_method_id       { "1"}
    owners_area_id           { "1"}
    arrival_date_id          { "1"}
    a_category_id            { "1"}
    # a_categoryは後にcategoryに変更する
    user
    # user                     { FactoryBot.create(:user)}
    # a_category,userは通常item_spec.rbでのFactoryBotの記述で十分なはずですが、
    # それで上手くいかなかったため、キーにバリューを直接セットしています。
    buyer_id                 {"1"}

    after(:build) do |item|
      item.item_images << FactoryBot.build(:item_image, item: item)
      item.status = Status.all.sample
      item.shipping_fee = ShippingFee.all.sample
      item.shipping_method = ShippingMethod.all.sample
      item.owners_area = OwnersArea.all.sample
      item.arrival_date = ArrivalDate.all.sample
      item.a_category = ACategory.all.sample
    end

  end
end
