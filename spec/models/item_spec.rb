require 'rails_helper'
RSpec.describe Item, type: :model do
end

describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品がうまくいくとき' do
      it 'image,item_name,detail,category,item_condition,delivery_fee,shipping_origin,shipping_leadtime,priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'detailが空では登録できない' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end
      it 'categoryの選択が「---」のままになっていると登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it 'item_conditionの選択が「---」のままになっていると登録できない' do
        @item.item_condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition Select")
      end
      it 'delivery_feeの選択が「---」のままになっていると登録できない' do
        @item.delivery_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee Select")
      end
      it 'shipping_originの選択が「---」のままになっていると登録できない' do
        @item.shipping_origin_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping origin Select")
      end
      it 'shipping_leadtimeの選択が「---」のままになっていると登録できない' do
        @item.shipping_leadtime_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping leadtime Select")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが存在しても¥300〜¥9,999,999以外は登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'priceが存在しても全角数字では登録できない' do
        @item.price = '００００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
    end
  end
end
