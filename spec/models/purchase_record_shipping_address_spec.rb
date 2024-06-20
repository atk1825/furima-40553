require 'rails_helper'

RSpec.describe PurchaseRecordShippingAddress, type: :model do
  before do
    @purchase_record_shipping_address = FactoryBot.build(:purchase_record_shipping_address)
  end
  describe '商品購入機能' do
    context '商品を購入できる時' do
      it 'post_numberとarea_idとmunicipalityとstreet_addressとtelephone_numberとtokenがあれば購入を進められる' do
        expect(@purchase_record_shipping_address).to be_valid
      end
      it 'building_nameが空でも購入を進められる' do
        @purchase_record_shipping_address.building_name = ''
        expect(@purchase_record_shipping_address).to be_valid
      end
    end
    context '商品を購入できない時' do
    it '郵便番号が空では保存できない' do
      @purchase_record_shipping_address.post_number = nil
      @purchase_record_shipping_address.valid?
      expect(@purchase_record_shipping_address.errors.full_messages).to include "Post number can't be blank"
    end
    it '郵便番号は、「3桁ハイフン4桁」の半角文字列意外だと購入できない' do
      @purchase_record_shipping_address.post_number = '1114444'
      @purchase_record_shipping_address.valid?
      expect(@purchase_record_shipping_address.errors.full_messages).to include "Post number is invalid. Include hyphen(-)"
    end
    it '都道府県が空では購入できない' do
      @purchase_record_shipping_address.area_id = 1
      @purchase_record_shipping_address.valid?
      expect(@purchase_record_shipping_address.errors.full_messages).to include "Area can't be blank"
    end
    it '市区町村が空では購入できない' do
      @purchase_record_shipping_address.municipality = ""
      @purchase_record_shipping_address.valid?
      expect(@purchase_record_shipping_address.errors.full_messages).to include "Municipality can't be blank"
    end
    it '番地が空では購入できない' do
      @purchase_record_shipping_address.street_address = ""
      @purchase_record_shipping_address.valid?
      expect(@purchase_record_shipping_address.errors.full_messages).to include "Street address can't be blank"
    end
    it '電話番号が空では購入できない' do
      @purchase_record_shipping_address.telephone_number = ""
      @purchase_record_shipping_address.valid?
      expect(@purchase_record_shipping_address.errors.full_messages).to include "Telephone number can't be blank"
    end
    it '電話番号が9桁以下では購入できない' do
      @purchase_record_shipping_address.telephone_number = '123456789'
      @purchase_record_shipping_address.valid?
      expect(@purchase_record_shipping_address.errors.full_messages).to include "Telephone number must be 10 to 11 digits"
    end
    it '電話番号が12桁以上では保存できない' do
      @purchase_record_shipping_address.telephone_number = '111122223333'
      @purchase_record_shipping_address.valid?
      expect(@purchase_record_shipping_address.errors.full_messages).to include 'Telephone number must be 10 to 11 digits'
    end
    it '電話番号に数字以外が含まれていると保存できない' do
      @purchase_record_shipping_address.telephone_number = '090-1234-5678'
      @purchase_record_shipping_address.valid?
      expect(@purchase_record_shipping_address.errors.full_messages).to include "Telephone number must be 10 to 11 digits"
    end
    it 'トークンが空では購入できない' do
      @purchase_record_shipping_address.token = nil
      @purchase_record_shipping_address.valid?
      expect(@purchase_record_shipping_address.errors.full_messages).to include "Token can't be blank"
    end
    end
  end
end
