FactoryBot.define do
  factory :item_image do
    image               {Rack::Test::UploadedFile.new(File.join("#{Rails.root}/public/images/test_image.jpeg"))}
    association         :item
  end
end
