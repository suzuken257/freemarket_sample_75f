require 'rails_helper'

describe Item do
  describe '#create' do
    # 1
    it "すべての項目を入力すれば登録できること" do
      item = build(:item)
      expect(item).to be_valid
    end
    # 2
    it " nameがない場合は登録できないこと" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end
    # 3
    it "nameが不適切ワードでは登録不可" do
      item = build(:item, name: "アホ")
      item.valid?
      expect(item.errors[:name]).to include("に不適切な単語が含まれています")
    end
    # 4
    it "priceが空では登録不可" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end
    # 5
    it "introductionが空では登録不可" do
      item = build(:item, introduction: "")
      item.valid?
      expect(item.errors[:introduction]).to include("を入力してください")
    end
    # 6
    it "introductionが不適切ワードでは登録不可" do
      item = build(:item, introduction: "アホ")
      item.valid?
      expect(item.errors[:introduction]).to include("に不適切な単語が含まれています")
    end
    # 7
    it "item_statusが空では登録不可" do
      item = build(:item, item_status: "")
      item.valid?
      expect(item.errors[:item_status]).to include("を入力してください")
    end
    # 8
    it "shipping_fee_burdenが空では登録不可" do
      item = build(:item, shipping_fee_burden: "")
      item.valid?
      expect(item.errors[:shipping_fee_burden]).to include("を入力してください")
    end
    # 9
    it "shipping_area_fromが空では登録不可" do
      item = build(:item, shipping_area_from: "")
      item.valid?
      expect(item.errors[:shipping_area_from]).to include("を入力してください")
    end

  end
end