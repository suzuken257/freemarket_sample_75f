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
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    # 3
    it " family_nameがない場合は登録できないこと" do
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("を入力してください")
    end

    # 4
    it " first_nameがない場合は登録できないこと" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    # 5
    it " family_name_kanaがない場合は登録できないこと" do
      user = build(:user, family_name_kana: nil)
      user.valid?
      expect(user.errors[:family_name_kana]).to include("を入力してください")
    end

    # 6
    it " first_name_kanaがない場合は登録できないこと" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end

    # 7
    it " birth_yearがない場合は登録できないこと" do
      user = build(:user, birth_year: nil)
      user.valid?
      expect(user.errors[:birth_year]).to include("を入力してください")
    end

    # 8
    it " birth_monthがない場合は登録できないこと" do
      user = build(:user, birth_month: nil)
      user.valid?
      expect(user.errors[:birth_month]).to include("を入力してください")
    end

    # 9
    it " birth_dayがない場合は登録できないこと" do
      user = build(:user, birth_day: nil)
      user.valid?
      expect(user.errors[:birth_day]).to include("を入力してください")
    end

    # 10
    it "emailがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    # 11
    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    # 12
    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    # 13
    it " passwordが7文字以上であれば登録できること " do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      expect(user).to be_valid
    end

    # 14
    it " passwordが6文字以下であれば登録できないこと " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

    # 15
    it "emailに＠がない場合保存できないこと" do
      user = build(:user, email: '12345678')
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    # 16
    it 'emailの＠以降のドメイン記述がない場合保存できないこと' do
      user = build(:user, email: '1234567@')
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    # 17
    it " 重複したemailが存在する場合は登録できないこと " do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    # 18
    it "nicknameが6文字以下では登録できること " do
      user = build(:user, nickname: "aaaaaa")
      expect(user).to be_valid
    end

    #19
    it "family_nameが半角である場合登録できないこと " do
      user = build(:user, family_name: "a")
      user.valid?
      expect(user.errors[:family_name]).to include("は不正な値です")
    end

    #20
    it "first_nameが半角である場合登録できないこと " do
      user = build(:user, first_name: "b")
      user.valid?
      expect(user.errors[:first_name]).to include("は不正な値です")
    end

    #21
    it "family_name_kanaが半角である場合登録できないこと " do
      user = build(:user, family_name_kana: "c")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("は不正な値です")
    end

    #22
    it "first_name_kanaが半角である場合登録できないこと " do
      user = build(:user, first_name_kana: "d")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は不正な値です")
    end

  end
end