require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe Item do
  describe '#create' do
    it "全てのカラム情報が存在し、priceが300以上10000000未満の値が存在している時" do
      item = build(:item)
      expect(item).to be_valid
    end
    
    it "brandは空で、brand以外の全てのカラム情報が存在し、priceが300以上10000000未満の値が存在している時" do
      item = build(:item, brand: nil)
      expect(item).to be_valid
    end

    it "nameがない場合は登録できないこと" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end
  
    it "priceがない場合は登録できないこと" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "priceが300未満の場合は登録出来ないこと" do
      item = build(:item, price: "299")
      item.valid?
      expect(item.errors[:price]).to include("is too cheap (minimum is 300)")
    end
  
    it "priceが300以上の場合は登録できること" do
      item = build(:item, price: "300")
      expect(item).to be_valid
    end    

    it "priceが10000000以上の場合は登録出来ないこと" do
      item = build(:item, price: "10000000")
      item.valid?
      expect(item.errors[:price]).to include("is too expensive (maximum is 9999999)")
    end
  
    it "priceが9999999以下の場合は登録できること" do
      item = build(:item, price: "9999999")
      expect(item).to be_valid
    end

    it "status_idがない場合は登録できないこと" do
      item = build(:item, status_id: nil)
      item.valid?
      expect(item.errors[:status_id]).to include("can't be blank")
    end

    it "shipping_fee_idがない場合は登録できないこと" do
      item = build(:item, shipping_fee_id: nil)
      item.valid?
      expect(item.errors[:shipping_fee_id]).to include("can't be blank")
    end

    it "owners_area_idがない場合は登録できないこと" do
      item = build(:item, owners_area_id: nil)
      item.valid?
      expect(item.errors[:owners_area_id]).to include("can't be blank")
    end

    it "arrival_date_idがない場合は登録できないこと" do
      item = build(:item, arrival_date_id: nil)
      item.valid?
      expect(item.errors[:arrival_date_id]).to include("can't be blank")
    end

    it "explainがない場合は登録できないこと" do
      item = build(:item, explain: nil)
      item.valid?
      expect(item.errors[:explain]).to include("can't be blank")
    end

    it "a_category_idがない場合は登録できないこと" do
      item = build(:item, a_category_id: nil)
      item.valid?
      expect(item.errors[:a_category_id]).to include("can't be blank")
    end

    it "user_idがない場合は登録できないこと" do
      item = build(:item, user_id: nil)
      item.valid?
      expect(item.errors[:user_id]).to include("can't be blank")
    end
  end
end