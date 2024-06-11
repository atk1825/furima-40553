class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
       
  validates :nickname, presence: true
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_zenkaku, presence: true
  validates :first_name_zenkaku, presence: true
  validates :birth, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Password is invalid. Include both letters and numbers'

  FAMILY_NAME_ZENKAKU_REGEX = /\A[ぁ-んァ-ヶ一-龥]+\z/
  validates_format_of :family_name_zenkaku, with: FAMILY_NAME_ZENKAKU_REGEX, message: 'is invalid. input full-width character'

  FIRST_NAME_ZENKAKU_REGEX = /\A[ぁ-んァ-ヶ一-龥]+\z/
  validates_format_of :first_name_zenkaku, with: FIRST_NAME_ZENKAKU_REGEX, message: 'is invalid. input full-width character'
end
