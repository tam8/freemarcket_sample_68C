require 'rails_helper'

RSpec.describe Item, type: :model  do
  describe '#create' do
    it "全てのカラム情報が存在し、priceが300以上10000000未満の値が存在している時" do
      category = create(:category)
      item = FactoryBot.build(:item, category_id: category.id)
      expect(item).to be_valid
    end
    
    it "brandは空で、brand以外の全てのカラム情報が存在し、priceが300以上10000000未満の値が存在している時" do
      item = FactoryBot.build(:item, brand: nil)
      expect(item).to be_valid
    end

    it "nameがない場合は登録できないこと" do
      item = FactoryBot.build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end
  
    it "priceがない場合は登録できないこと" do
      item = FactoryBot.build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "priceが300未満の場合は登録出来ないこと" do
      item = FactoryBot.build(:item, price: "299")
      item.valid?
      expect(item.errors[:price]).to include("must be greater than or equal to 300")
    end
  
    it "priceが300以上の場合は登録できること" do
      item = FactoryBot.build(:item, price: "300")
      expect(item).to be_valid
    end    

    it "priceが10000000以上の場合は登録出来ないこと" do
      item = FactoryBot.build(:item, price: "10000000")
      item.valid?
      expect(item.errors[:price]).to include("must be less than 10000000")
    end
  
    it "priceが9999999以下の場合は登録できること" do
      item = FactoryBot.build(:item, price: "9999999")
      expect(item).to be_valid
    end

    it "status_idがない場合は登録できないこと" do
      item = FactoryBot.build(:item, status_id: nil)
      item.valid?
      expect(item.errors[:status_id]).to include()
    end

    it "shipping_fee_idがない場合は登録できないこと" do
      item = FactoryBot.build(:item, shipping_fee_id: nil)
      item.valid?
      expect(item.errors[:shipping_fee_id]).to include("can't be blank")
    end

    it "owners_area_idがない場合は登録できないこと" do
      item = FactoryBot.build(:item, owners_area_id: nil)
      item.valid?
      expect(item.errors[:owners_area_id]).to include("can't be blank")
    end

    it "arrival_date_idがない場合は登録できないこと" do
      item = FactoryBot.build(:item, arrival_date_id: nil)
      item.valid?
      expect(item.errors[:arrival_date_id]).to include("can't be blank")
    end

    it "explainがない場合は登録できないこと" do
      item = FactoryBot.build(:item, explain: nil)
      item.valid?
      expect(item.errors[:explain]).to include("can't be blank")
    end

    it "category_idがない場合は登録できないこと" do
      item = FactoryBot.build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("を入力してください", "は数値で入力してください")
    end
    # カテゴリ機能のサーバサイドが完成してから修正の必要あり
    # 現在はactive_hashを利用したa_categoryのidデータを登録させるシステムになっています。

    it "user_idがない場合は登録できないこと" do
      item = FactoryBot.build(:item, user_id: nil)
      item.valid?
      expect(item.errors[:user]).to include("must exist")
    end

    it "画像がない場合は登録できないこと" do
      item = FactoryBot.build(:item)
      item.item_images = []
      # 94行目のitemが保存されたタイミングでitem_imagesが紐づけられるので、95行目でitem.saveが行われた後にitem_imagesを空にしています。
      item.valid?
      expect(item.errors[:item_images]).to include("can't be blank")
    end

    it "画像が2枚以上の場合でも登録できること" do
      item = FactoryBot.build(:item)
      item.item_images << FactoryBot.build(:item_image)
      expect(item).to be_valid
    end

  end
end