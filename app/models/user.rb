class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
       
  validates :nickname, presence: true
  validates :family_name, presence: true
  validates :firstname, presence: true
  validates :family_name_zenkaku, presence: true
  validates :first_name_zenkaku, presence: true
  validates :brith, presence: true
end
