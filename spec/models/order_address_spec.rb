require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it '全ての項目が入力されていると登録できる' do
        expect(@order_address).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'トークンが生成されていないと登録できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空だと登録できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号が数字でないと登録できない' do
        @order_address.postal_code = 'あああ'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end
      it '都道府県が---だと登録できない' do
        @order_address.shipping_region_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Shipping region must be other than 1")
      end
      it '市区町村が空だと登録できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと登録できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと登録できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が数字でないと登録できない' do
        @order_address.phone_number = 'あああ'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end


    end
  end
end
