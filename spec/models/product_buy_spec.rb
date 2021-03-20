require 'rails_helper'

RSpec.describe ProductBuy, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @product_buy = FactoryBot.build(:product_buy,user_id: user.id,item_id: item.id)
      sleep 1
    end

    context '商品購入がうまくいくとき' do
      it '全ての値が正しく入力されていれば登録出来る' do
        expect(@product_buy).to be_valid
      end
      it 'ビル名は空欄でも登録が出来る' do
        @product_buy.addres2 = ''
        expect(@product_buy).to be_valid
      end
    end
    context '商品出品がうまくいかないとき' do
      it 'priceが空では登録できないこと' do
        @product_buy.price = nil
        @product_buy.valid?
        expect(@product_buy.errors.full_messages).to include("Price can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @product_buy.token = nil
        @product_buy.valid?
        expect(@product_buy.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が無いと登録出来ない' do
        @product_buy.zip_code = nil
        @product_buy.valid?
        expect(@product_buy.errors.full_messages).to include("Zip code can't be blank", 'Zip code is invalid')
      end
      it '郵便番号にはハイフンが無いと登録出来ない' do
        @product_buy.zip_code = '1234567'
        @product_buy.valid?
        expect(@product_buy.errors.full_messages).to include('Zip code is invalid')
      end
      it 'デリバリーエリアIDが1だと登録出来ない' do
        @product_buy.delivery_area_id = 1
        @product_buy.valid?
        expect(@product_buy.errors.full_messages).to include('Delivery area must be other than 1')
      end
      it '市区町村が無いと登録出来ない' do
        @product_buy.city = ''
        @product_buy.valid?
        expect(@product_buy.errors.full_messages).to include("City can't be blank", 'City is invalid')
      end
      it '番地が無いと登録出来ない' do
        @product_buy.addres1 = ''
        @product_buy.valid?
        expect(@product_buy.errors.full_messages).to include("Addres1 can't be blank")
      end
      it '電話番号が無いと登録出来ない' do
        @product_buy.tell_num = ''
        @product_buy.valid?
        expect(@product_buy.errors.full_messages).to include("Tell num can't be blank", 'Tell num is invalid')
      end
      it '電話番号にハイフンがあると登録出来ない' do
        @product_buy.tell_num = '090-1234-5678'
        @product_buy.valid?
        expect(@product_buy.errors.full_messages).to include('Tell num is invalid')
      end
      it '電話番号が11桁以上では登録出来ない' do
        @product_buy.tell_num = '090123456789'
        @product_buy.valid?
        expect(@product_buy.errors.full_messages).to include('Tell num is too long (maximum is 11 characters)')
      end
      it '電話番号が英数混合では登録出来ない' do
        @product_buy.tell_num = '090eeee5678'
        @product_buy.valid?
        expect(@product_buy.errors.full_messages).to include("Tell num is invalid")
      end
      it 'user_idが空であると登録できない' do
        @product_buy.user_id = ''
        @product_buy.valid?
        expect(@product_buy.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空であると登録できない' do
        @product_buy.item_id = ''
        @product_buy.valid?
        expect(@product_buy.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
