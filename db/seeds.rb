# if Rails.env == "development"
  # (1..5).each do |i|
  #   User.create!(
  #     email: "#{i}@mail.com",
  #     nickname: "ユーザー#{i}",
  #     password: "#{i}",
  #     reset_password_token: "#{i}",
  #     reset_password_sent_at: "#{i}",
  #     remember_created_at: "#{i}"
  #   )
  # end
# end





#CSV記法#############################
require "csv"

CSV.foreach("db/seeds/user.csv", headers: true) do |row|
  User.create!(
    email: row["email"],
    nickname: row["nickname"],
    password: row["password"],
    reset_password_token: row["reset_password_token"],
    reset_password_sent_at: row["reset_password_sent_at"],
    remember_created_at: row["remember_created_at"]
  )
end

# active_hashの方を利用
# CSV.foreach("db/seeds/category.csv", headers: true) do |row|
#   Category.create!(
#     name: row["name"]
#   )
# end

CSV.foreach("db/seeds/item.csv", headers: true) do |row|
  Item.create!(
    name: row["name"],
    price: row["price"],
    status_id: row["status_id"],
    brand: row["brand"],
    shipping_fee_id: row["shipping_fee_id"],
    shipping_method_id: row["shipping_method_id"],
    owners_area_id: row["owners_area_id"],
    arrival_date_id: row["arrival_date_id"],
    explain: row["explain"],
    a_category_id: row["a_category_id"],
    # user_id: row["user_id"],
    buyer_id: row["buyer_id"]
    # 不要っぽい
    # item_image_id: row["item_image_id"]
  )
end

CSV.foreach("db/seeds/item_image.csv", headers: true) do |row|
  ItemImage.create!(
    image: row["image"],
    item_id: row["item_id"]
  )
end







#直接記法#############################

# categoriesテーブル
  # Category.create!(
  #   name: "PCパーツ"
  # )
  # Category.create!(
  #   name: "子供服"
  # )


# # item_imagesテーブル
#   ItemImage.create!(
#     image_url: "https://images-na.ssl-images-amazon.com/images/I/31EskQ9W9iL._AC_SY400_.jpg",
#     item_id: "2"
#   )
#   ItemImage.create!(
#     image_url: "https://item-shopping.c.yimg.jp/i/n/lifestyle-007_70738",
#     item_id: "2"
#   )
#   ItemImage.create!(
#     image_url: "https://www.momofukugyu.jp/choice/yakiniku/img/kv_img01.jpg",
#     item_id: "1"
#   )
#   ItemImage.create!(
#     image_url: "https://m.media-amazon.com/images/G/01/mobile-apps/dex/firetv/catthumb_firetv_cube._CB1570429193_.png",
#     item_id: "2"
#   )


# # usersテーブル
# User.create!(
#   email: "t@p.com",
#   nickname: "Tamura1",
#   password: "a21se234"
# )



# # itemsテーブル
#   Item.create!(
#     name: "お肉",
#     price: "1000",
#     status: "中古",
#     brand: "",
#     shipping_fee: "",
#     shipping_method: "",
#     owners_area: "",
#     arrival_date: "",
#     explain: "",
#     category_id: "2",
#     user_id: "1",
#     buyer_id: "",
#     item_image_id: "1"
#   )
#   Item.create!(
#     name: "FireTV",
#     price: "4000",
#     status: "中古",
#     brand: "Amazon",
#     shipping_fee: "出品者負担",
#     shipping_method: "メルカリ便",
#     owners_area: "東京",
#     arrival_date: "1～2日で発送",
#     explain: "ここにい説明を書きます。ここにい説明を書きます。ここにい説明を書きます。ここにい説明を書きます。",
#     category_id: "1",
#     user_id: "1",
#     buyer_id: "2",
#     item_image_id: "2"
#   )





