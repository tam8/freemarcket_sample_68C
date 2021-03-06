class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :first_name, :last_name, :birth_date, :first_name_kana, :last_name_kana ,presence: true
  validates :first_name_kana, :last_name_kana ,presence: true,
                                                format: {
                                                  with: /\A[ぁ-んー－]+\z/,
                                                  # allow_blank: true
                                                  message: "を全角ひらがなのみで入力して下さい"
                                                }

  devise :database_authenticatable, :validatable, password_length: 7..128
  has_many :items
  has_many :cards
  has_one :address
end
