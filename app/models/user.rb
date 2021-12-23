class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :order_history
  has_many :items

  with_options presence: true do
    validates :nickname
    validates :birthday
    VALID_last_name_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
    validates :last_name, format: { with: VALID_last_name_REGEX, message: 'は漢字・ひらがな・カタカナで記述する必要があります' }
    VALID_last_name_furigana_REGEX = /\A[ァ-ヶー－]+\z/
    validates :last_name_furigana, format: { with: VALID_last_name_furigana_REGEX, message: 'はカタカナで記述する必要があります' }
    VALID_first_name_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
    validates :first_name, format: { with: VALID_first_name_REGEX, message: 'は漢字・ひらがな・カタカナで記述する必要があります' }
    VALID_first_name_furigana_REGEX = /\A[ァ-ヶー－]+\z/
    validates :first_name_furigana, format: { with: VALID_first_name_furigana_REGEX, message: 'はカタカナで記述する必要があります' }
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります' }
  end
end
