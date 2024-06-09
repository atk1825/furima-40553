class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
       
  validates :nickname, presence: true
  validates :family_name, presece: true
  validates :firstname, presece: true
  validates :family_name_zenkaku, presece: true
  validates :first_name_zenkaku, presece: true
  validates :brith, presece: true
end
