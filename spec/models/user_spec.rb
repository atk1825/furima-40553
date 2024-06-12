require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザ新規登録' do
    it 'ニックネームが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'メールアドレスが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'パスワードが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'パスワードが英語だけでは登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password Password is invalid. Include both letters and numbers'
    end
    it 'パスワードが数字だけでは登録できない' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password Password is invalid. Include both letters and numbers'
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it '名字(全角)が空では登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name can't be blank"
    end
    it '名前(全角)が空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it 'カタカナ名字(全角)が空では登録できない' do
      @user.family_name_zenkaku = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name zenkaku can't be blank"
    end
    it 'カタカナ名字(全角)はカタカナでないと登録できない' do
      @user.family_name_zenkaku = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Family name zenkaku is invalid. input full-width character'
    end
    it 'カタカナ名前(全角)が空では登録できない' do
      @user.first_name_zenkaku = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name zenkaku can't be blank"
    end
    it 'カタカナ名前(全角)がカタカナでないと登録できない' do
      @user.first_name_zenkaku = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name zenkaku is invalid. input full-width character'
    end
    it '生年月日が空では登録できない' do
      @user.birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth can't be blank"
    end
    it '重複したメールアドレスが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include 'Email has already been taken'
    end
    it 'メールアドレスは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Email is invalid'
    end
    it 'パスワードが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
    end
    it 'パスワードが129文字以下では登録できない' do
      @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is too long (maximum is 128 characters)'
    end
  end
end
