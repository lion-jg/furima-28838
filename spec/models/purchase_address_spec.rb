require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
end

describe  PurchaseAddress do
  before do
    @purchase = FactoryBot.build(:purchase_address)
  end

  describe '商品購入' do
    context '購入がうまくいくとき' do
      it 'token, postal_code, shipping_origin_id, city, block_num, phone_numが存在すれば購入できる' do
        expect(@purchase).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it 'tokenが空では購入できない' do
        @purchase.token = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空では購入できない' do
        @purchase.postal_code = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが存在しても「3桁の数字 ー 4桁の数字」以外の記述では購入できない' do
        @purchase.postal_code = '0000000'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code Input correctly")
      end
      it 'shipping_originの選択が「---」のままになっていると購入できない' do
        @purchase.shipping_origin_id = 1
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Shipping origin Select")
      end
      it 'cityが空では購入できない' do
        @purchase.city = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("City can't be blank")
      end
      it 'block_numが空では購入できない' do
        @purchase.block_num = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Block num can't be blank")
      end
      it 'phone_numが空では購入できない' do
        @purchase.phone_num = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone num can't be blank")
      end
      it 'phone_numが存在しても「ー」があると購入できない' do
        @purchase.phone_num = '000-000-0000'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone num Input correctly")
      end
    end
  end
end

