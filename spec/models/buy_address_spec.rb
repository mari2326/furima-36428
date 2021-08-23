require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
 describe '#create' do
   before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      sleep 0.1
      @buy_address = FactoryBot.build(:buy_address, user_id: user.id, item_id: item.id)
    end
  
    describe '商品購入入力' do
      context '商品購入できるとき' do
        it '全ての値が正しく入力されていれば購入できること' do
          expect(@buy_address).to be_valid
        end

        it 'building_nameは空でも購入できること' do
          @buy_address.building_name = ''
          expect(@buy_address).to be_valid
        end
      end

      context '商品購入できないとき' do
        it 'post_codeが空では購入できない' do
          @buy_address.post_code = ''
          @buy_address.valid?
          expect(@buy_address.errors.full_messages).to include("Post code can't be blank")
        end

        it 'post_codeは「3桁ハイフン4桁」でないと購入できない' do
          @buy_address.post_code = '1234567'
          @buy_address.valid?
          expect(@buy_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")       
         end

         it 'post_codeは半角でないと購入できない' do
          @buy_address.post_code = '１２３ー４５６７'
          @buy_address.valid?
          expect(@buy_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")       
         end

        it 'prefectur_idが空では購入できない' do
          @buy_address.prefecture_id = ''
          @buy_address.valid?
          expect(@buy_address.errors.full_messages).to include("Prefecture can't be blank")
        end

        it 'prefecture_idが1では購入できないこと' do
          @buy_address.prefecture_id = 1
          @buy_address.valid?
          expect(@buy_address.errors.full_messages).to include("Prefecture can't be blank")
        end 

        it 'municipalityが空だと購入できない' do
          @buy_address.municipality = ''
          @buy_address.valid?
          expect(@buy_address.errors.full_messages).to include("Municipality can't be blank")
        end

        it 'street_numberが空だと購入できない' do
          @buy_address.street_number = ''
          @buy_address.valid?
          expect(@buy_address.errors.full_messages).to include("Street number can't be blank")
        end

        it 'telephone_numberが空だと購入できない' do
          @buy_address.telephone_number = ''
          @buy_address.valid?
          expect(@buy_address.errors.full_messages).to include("Telephone number can't be blank")
        end

        it 'telephone_numberは10桁以下では購入できない'do
          @buy_address.telephone_number = '090123456'
          @buy_address.valid?
          expect(@buy_address.errors.full_messages).to include("Telephone number is invalid")
        end

        it 'telephone_numberは11桁以上では購入できない'do
          @buy_address.telephone_number = '090123456789'
          @buy_address.valid?
          expect(@buy_address.errors.full_messages).to include("Telephone number is invalid")
        end

        it 'telephone_numberは半角でないと購入できない'do
        @buy_address.telephone_number = '０９０１２３４５６７８'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Telephone number is invalid")
      end

      it 'telephone_numberは数値でないと購入できない'do
        @buy_address.telephone_number = 'aaabbbbcccc'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Telephone number is invalid")
      end
      end
     end
  end
end

