json.array! @items do |item|
  json.id  item.id
  json.name  item.name
  json.price  item.price
  json.status_id  item.status_id
  json.brand  item.brand
  json.shipping_fee_id  item.shipping_fee_id
  json.shipping_method_id item.shipping_method_id
  json.owners_area_id item.owners_area_id
  json.arrival_date_id  item.arrival_date_id
  json.explain  item.explain
  json.category_id  item.category_id
  json.buyer_id item.buyer_id
  json.user_id  item.user_id
  json.item_images item.item_images.first
end