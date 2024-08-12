class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :family_name, presence: true,
                          format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角で入力してください' }
  validates :first_name, presence: true,
                         format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角で入力してください' }
  validates :family_name_zenkaku, presence: true
  validates :first_name_zenkaku, presence: true
  validates :birth, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は半角英数字で入力してください'

  FAMILY_NAME_ZENKAKU_REGEX = /\A[ァ-ヶー]+\z/
  validates_format_of :family_name_zenkaku, with: FAMILY_NAME_ZENKAKU_REGEX, message: 'は全角カタカナで入力してください'

  FIRST_NAME_ZENKAKU_REGEX = /\A[ァ-ヶー]+\z/
  validates_format_of :first_name_zenkaku, with: FIRST_NAME_ZENKAKU_REGEX, message: 'は全角カタカナで入力してください'

  has_many :items
  has_many :purchase_records
end
