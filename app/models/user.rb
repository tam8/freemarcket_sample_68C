class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  validates :nickname, :first_name, :last_name, :birth_date, :first_name_kana, :last_name_kana ,presence: true
  validates :first_name_kana, :last_name_kana ,presence: true,
                                                format: {
                                                  with: /\A[ぁ-んー－]+\z/,
                                                  # allow_blank: true
                                                  message: "を全角ひらがなのみで入力して下さい"
                                                }

  devise :database_authenticatable, :validatable, password_length: 7..128
  has_many :items
  has_one :address
  has_many :sns_credentials

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
