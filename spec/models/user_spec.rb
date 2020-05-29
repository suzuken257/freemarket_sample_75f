require 'rails_helper'

describe User do
  describe '#create' do
    # 1
    it "すべての項目を入力すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    # 2
    it " nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    # 3
    it " family_nameがない場合は登録できないこと" do
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("can't be blank")
    end

    # 4
    it " first_nameがない場合は登録できないこと" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    # 5
    it " family_name_kanaがない場合は登録できないこと" do
      user = build(:user, family_name_kana: nil)
      user.valid?
      expect(user.errors[:family_name_kana]).to include("can't be blank")
    end

    # 6
    it " first_name_kanaがない場合は登録できないこと" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

    # 7
    it "emailがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # 8
    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    # 9
    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    # 10
    it "emailがフォーマット通りになっていない場合登録できないこと1" do
      user = build(:user, email: '12345678')
      user.valid?
      expect(user.errors[:email]).to include("のフォーマットが不適切です")
    end

    # 11
    it 'emailがフォーマット通りになっていない場合登録できないこと2' do
      user = build(:user, email: '1234567@')
      user.valid?
      expect(user.errors[:email]).to include("のフォーマットが不適切です")
    end

    # 12
    it "nicknameが6文字以下では登録できること " do
      user = build(:user, nickname: "aaaaaa")
      expect(user).to be_valid
    end

    # 13
    it " 重複したemailが存在する場合は登録できないこと " do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    # 14
    it " passwordが7文字以上であれば登録できること " do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user).to be_valid
    end

    # 15
    it " passwordが6文字以下であれば登録できないこと " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
    end

    # # it "family_name_kanaが半角である場合登録できないこと " do
    # #   user = build(:user, family_name_kana: "a")
    # #   user.valid?
    # #   expect(user).to be_valid
    # # end

    # # it "first_name_kanaが半角である場合登録できないこと " do
    # #   user = build(:user, first_name_kana: "a")
    # #   user.valid?
    # #   expect(user).to be_valid
    # # end


  end
end