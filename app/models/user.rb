class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :birth_dd
  belongs_to_active_hash :birth_mm
  belongs_to_active_hash :birth_yyyy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2],
         password_length: 7..128


  has_one :deliver_address, dependent: :destroy
  has_many :credit_cards, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :sns_credentials

  validates :nickname, presence: true
  validates :family_name, {presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }}
  validates :first_name, {presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }}
  validates :family_name_kana, {presence: true, format: { with: /\A[ぁ-ん]+\z/ }}
  validates :first_name_kana, {presence: true, format: { with: /\A[ぁ-ん]+\z/ }}
  validates :birth_year, presence: true
  validates :birth_month, presence: true
  validates :birth_day, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, {presence: true, format: { with: VALID_EMAIL_REGEX }}

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    # userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end

end
