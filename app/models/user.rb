class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :validatable, password_length: 7..128
  has_one :deliver_address, dependent: :destroy
  has_many :credit_card, dependent: :destroy
  has_many :items, dependent: :destroy

  validates :nickname, presence: true
  validates :family_name, {presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }}
  validates :first_name, {presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }}
  validates :family_name_kana, {presence: true, format: { with: /\A[ぁ-ん]+\z/ }}
  validates :first_name_kana, {presence: true, format: { with: /\A[ぁ-ん]+\z/ }}
  # validates :birth_year, presence: true
  # validates :birth_month, presence: true
  # validates :birth_day, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, {presence: true, format: { with: VALID_EMAIL_REGEX }}

end
