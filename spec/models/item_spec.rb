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
    # 10
    it "estimated_shipping_dateが空では登録不可" do
      item = build(:item, estimated_shipping_date: "")
      item.valid?
      expect(item.errors[:estimated_shipping_date]).to include("を入力してください")
    end
    # 11
    it "nameの文字数が41文字以上だと登録不可" do
      item = build(:item, name: "a" * 41)
      item.valid?
      expect(item.errors[:name]).to include("は40文字以内で入力してください")
    end
    # 12
    it "nameの文字数が40字以内だと登録可能" do
      item = build(:item, name: "a" * 39)
      expect(item).to be_valid
    end
    # 13
    it "introductionの文字が1001文字以上だと登録不可" do
      item = build(:item, introduction: "a" * 1001)
      item.valid?
      expect(item.errors[:introduction]).to include("は1000文字以内で入力してください")
    end
    # 14
    it "introductionの文字数が1000字以内だと登録可能" do
      item = build(:item, introduction: "a" * 1000)
      expect(item).to be_valid
    end
    # 15
    it " categoryが空では登録不可" do
      item = build(:item, category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("を入力してください")
    end
    # 16
    it "brandがなくても保存できる" do
      item = build(:item, brand: "")
      expect(item).to be_valid
    end
    # 17
    it "sizeがなくても保存できる" do
      item = build(:item, size: "")
      expect(item).to be_valid
    end
    # 18
    it "priceが10000000円以上だと登録不可" do
      item = build(:item, price: 10000000)
      item.valid?
      expect(item.errors[:price]).to include("は一覧にありません")
    end
    # 19
    it "priceが9999999円だと登録可能" do
      item = build(:item, price: 9999999)
      expect(item).to be_valid
    end
     # 20
     it "priceが299円以下だと登録不可" do
      item = build(:item, price: 299)
      item.valid?
      expect(item.errors[:price]).to include("は一覧にありません")
    end
    # 21
    it "priceが300円だと登録可能" do
      item = build(:item, price: 300)
      expect(item).to be_valid
    end
  end


  describe '#update' do
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
    # 10
    it "estimated_shipping_dateが空では登録不可" do
      item = build(:item, estimated_shipping_date: "")
      item.valid?
      expect(item.errors[:estimated_shipping_date]).to include("を入力してください")
    end
    # 11
    it "nameの文字数が41文字以上だと登録不可" do
      item = build(:item, name: "a" * 41)
      item.valid?
      expect(item.errors[:name]).to include("は40文字以内で入力してください")
    end
    # 12
    it "nameの文字数が40字以内だと登録可能" do
      item = build(:item, name: "a" * 39)
      expect(item).to be_valid
    end
    # 13
    it "introductionの文字が1001文字以上だと登録不可" do
      item = build(:item, introduction: "a" * 1001)
      item.valid?
      expect(item.errors[:introduction]).to include("は1000文字以内で入力してください")
    end
    # 14
    it "introductionの文字数が1000字以内だと登録可能" do
      item = build(:item, introduction: "a" * 1000)
      expect(item).to be_valid
    end
    # 15
    it " categoryが空では登録不可" do
      item = build(:item, category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("を入力してください")
    end
    # 16
    it "brandがなくても保存できる" do
      item = build(:item, brand: "")
      expect(item).to be_valid
    end
    # 17
    it "sizeがなくても保存できる" do
      item = build(:item, size: "")
      expect(item).to be_valid
    end
    # 18
    it "priceが10000000円以上だと登録不可" do
      item = build(:item, price: 10000000)
      item.valid?
      expect(item.errors[:price]).to include("は一覧にありません")
    end
    # 19
    it "priceが9999999円だと登録可能" do
      item = build(:item, price: 9999999)
      expect(item).to be_valid
    end
     # 20
     it "priceが299円以下だと登録不可" do
      item = build(:item, price: 299)
      item.valid?
      expect(item.errors[:price]).to include("は一覧にありません")
    end
    # 21
    it "priceが300円だと登録可能" do
      item = build(:item, price: 300)
      expect(item).to be_valid
    end
  end
end