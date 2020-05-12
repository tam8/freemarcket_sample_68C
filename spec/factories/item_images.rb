FactoryBot.define do
  factory :item_image do
    image               { Rack::Test::UploadedFile.new(File.join(Rails.root, '/public/images/test_image.jpeg'))}
    # item                { FactoryBot.create(:item)}
    association         :item
  end
end
