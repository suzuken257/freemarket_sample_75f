class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :validatable, password_length: 7..128
  has_one :deliver_address, dependent: :destroy
  has_one :credit_card, dependent: :destroy
  has_many :items, dependent: :destroy
end
