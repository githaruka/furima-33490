require 'rails_helper'

RSpec.describe BuyForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @buy_form = FactoryBot.build(:buy_form, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end

  describe '商品購入' do
    context '商品購入ができるとき' do
      it '建物名以外の項目の入力が存在すれば登録できる' do
        expect(@buy_form).to be_valid
      end

      it 'buildingは空でも購入できる' do
        @buy_form.building = nil
        expect(@buy_form).to be_valid
      end
    end

    context '商品購入ができない' do
      it 'postal_codeにハイフンが含まれないと購入できない' do
        @buy_form.postal_code = '0000000'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include('Postal code is invalid')
      end

      it 'postal_codeが空では購入できない' do
        @buy_form.postal_code = nil
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'prefecture_idが1では購入できない' do
        @buy_form.prefecture_id = 1
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include('Prefecture Select')
      end

      it 'cityが空では購入できない' do
        @buy_form.city = nil
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空では購入できない' do
        @buy_form.address = nil
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空では購入できない' do
        @buy_form.phone_number = nil
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberにハイフンが含まれると購入できない' do
        @buy_form.phone_number = '080-0000-0000'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが12桁以上だと購入できない' do
        @buy_form.phone_number = '123456789123'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include('Phone number is invalid')
      end
  
      it 'tokenが空では登録できないこと' do
        @buy_form.token = nil
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空では登録できない' do
        @buy_form.user_id = nil
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では登録できない' do
        @buy_form.item_id = nil
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Item can't be blank")
      end

      it 'phone_numberは英数混合では登録できない' do
        @buy_form.phone_number = '123456789ab'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
