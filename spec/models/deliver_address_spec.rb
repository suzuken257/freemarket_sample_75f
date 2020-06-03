require 'rails_helper'

describe DeliverAddress, type: :model do
  describe '#create' do
    # 1
    it "すべての項目を入力すれば登録できること" do
      deliver_address = build(:deliver_address)
      expect(deliver_address).to be_valid
    end

    # 2
    it "family_nameがない場合は登録できないこと" do
      deliver_address = build(:deliver_address, family_name: nil)
      deliver_address.valid?
      expect(deliver_address.errors[:family_name]).to include("を入力してください")
    end

    # 3
    it "first_nameがない場合は登録できないこと" do
      deliver_address = build(:deliver_address, first_name: nil)
      deliver_address.valid?
      expect(deliver_address.errors[:first_name]).to include("を入力してください")
    end

    # 4
    it "family_name_kanaがない場合は登録できないこと" do
      deliver_address = build(:deliver_address, family_name_kana: nil)
      deliver_address.valid?
      expect(deliver_address.errors[:family_name_kana]).to include("を入力してください")
    end

    # 5
    it "first_name_kanaがない場合は登録できないこと" do
      deliver_address = build(:deliver_address, first_name_kana: nil)
      deliver_address.valid?
      expect(deliver_address.errors[:first_name_kana]).to include("を入力してください")
    end

    # 6
    it "郵便番号がない場合は登録できないこと" do
      deliver_address = build(:deliver_address, zip_code: nil)
      deliver_address.valid?
      expect(deliver_address.errors[:zip_code]).to include("を入力してください")
    end

    # 7
    it "都道府県がない場合は登録できないこと" do
      deliver_address = build(:deliver_address, prefecture_id: nil)
      deliver_address.valid?
      expect(deliver_address.errors[:prefecture_id]).to include("を入力してください")
    end

    # 8
    it "市区町村がない場合は登録できないこと" do
      deliver_address = build(:deliver_address, city: nil)
      deliver_address.valid?
      expect(deliver_address.errors[:city]).to include("を入力してください")
    end

    # 9
    it "番地がない場合は登録できないこと" do
      deliver_address = build(:deliver_address, address1: nil)
      deliver_address.valid?
      expect(deliver_address.errors[:address1]).to include("を入力してください")
    end

    # 10
    it "建物名がなくても登録できること" do
      deliver_address = build(:deliver_address, apartment_address: nil)
      expect(deliver_address).to be_valid
    end

    # 11
    it "電話番号がなくても登録できること" do
      deliver_address = build(:deliver_address, telephone: nil)
      expect(deliver_address).to be_valid
    end

  end
end