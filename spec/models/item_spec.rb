require 'rails_helper'

RSpec.describe '商品出品機能', type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '' do
    context '商品出品がうまくいくとき' do
      it '出品画像,商品名,商品の説明,カテゴリー,商品の状態,発送元の地域,発送までの日数,価格があれば登録出来る' do
        expect(@item).to be_valid
      end
    end
    context '商品出品がうまくいかないとき' do
      it '出品画像が無いと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が無いと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'カテゴリーidが１だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it '商品状態のidが1だと登録できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('State must be other than 1')
      end
      it '配送料負担のidが1だと登録できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee must be other than 1')
      end
      it '配送元地域のidが1だと登録できない' do
        @item.delivery_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery area must be other than 1')
      end
      it '配送までの日数idが1だと登録できない' do
        @item.delivery_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery time must be other than 1')
      end
      it '価格が無いと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number", "Price is not a number", "Price is not a number")
      end
      it '価格が300未満だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格が9,999,999より大きいと登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '価格は半角数字でないと登録できない' do
        @item.price = '１０００００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number', 'Price is not a number', 'Price is not a number')
      end
      it '価格は半角英数字混合では登録できない' do
        @item.price = 'a1000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number', 'Price is not a number', 'Price is not a number')
      end
      it '価格は半角英字のみでは登録できない' do
        @item.price = 'abcd'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number', 'Price is not a number', 'Price is not a number')
      end
    end
  end
end
