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
end
end
