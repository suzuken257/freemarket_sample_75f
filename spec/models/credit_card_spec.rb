require 'rails_helper'

describe CreditCard do
  describe '#pay' do
    # 1 
    it "すべての項目を入力すれば登録できること" do
      pay = build(:credit_card)
      expect(pay).to be_valid
    end

    # 2
    it "正しいクレジットカードの情報じゃないと登録できない" do
      pay = build(:credit_card, payjp_id: nil)
      pay.valid?
      expect(pay.errors[:payjp_id]).to include("を入力してください")
    end
  end
end