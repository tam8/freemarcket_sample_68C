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
  end
end