require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品出品入力' do
      
      context '商品出品できるとき' do
        it '全て存在すれば出品できること' do
          expect(@item).to be_valid
        end
      end
    
      context '商品出品できないとき' do
        it 'nameが空では出品できないこと' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end

        it 'explanationが空では出品できないこと' do
          @item.explanation = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Explanation can't be blank")
        end

        it 'category_idが空では出品できないこと' do
          @item.category_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end

        it 'category_idが1では出品できないこと' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end

        it 'scheduled_state_idが空では出品できないこと' do
          @item.scheduled_state_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Scheduled state can't be blank")
        end

        it 'scheduled_state_idが1では出品できないこと' do
          @item.scheduled_state_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Scheduled state can't be blank")
        end

        it 'shipping_charge_idが空では出品できないこと' do
          @item.shipping_charge_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
        end

        it 'shipping_charge_idが1では出品できないこと' do
          @item.shipping_charge_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
        end

        it 'prefecture_idが空では出品できないこと' do
          @item.prefecture_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end

        it 'prefecture_idが1では出品できないこと' do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end

        it 'scheduled_day_idが空では出品できないこと' do
          @item.scheduled_day_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Scheduled day can't be blank")
        end

        it 'scheduled_day_idが1では出品できないこと' do
          @item.scheduled_day_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Scheduled day can't be blank")
        end

        it 'priceが空では出品できないこと' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it 'priceが¥300より少ないときは出品できないこと' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
        end

        it 'priceが¥9999999より多いときは出品できないこと' do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
        end

        it 'priceが半角数値でないと出品できないこと' do
          @item.price = '５５５５５'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
        
        it 'imageが空では出品できないこと' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it 'userが紐付いていないと出品できないこと' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("User must exist")
        end
      end    
    end
  end  
end
