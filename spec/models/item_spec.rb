require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品を出品できる時' do
      it 'nameとexplanationとcategory_idとquality_idとpriceとshipping_charge_idとarea_idとdelivery_date_idとimageが存在すれば保存できる' do
        expect(@item).to be_valid
      end
    end
    
    
    context '商品を出品できない時' do
      it 'nameが空では保存できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'introductionが空では保存できないこと' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'category_idが空では保存できないこと' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end

      it 'quality_idが空では保存できないこと' do
        @item.quality_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Quality is not a number")
      end

      it 'priceが空では保存できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'shipping_charge_idが空では保存できないこと' do
        @item.shipping_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge is not a number", "Shipping charge is not a number")
      end

      it 'area_idが空では保存できないこと' do
        @item.area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end

      it 'delivery_date_idが空では保存できないこと' do
        @item.delivery_date_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date is not a number")
      end

      it 'imageが空では保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'priceの値がが300以下では保存できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it 'priceの値が9999999以上だと保存できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it 'priceの値が全角数字では出品出来ない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'priceが数字以外が混じっていると出品できない' do
        @item.price = 'aaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
       end

      it 'priceが半角英数混合では登録できないこと' do
        @item.price = 'a1b2c3'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
 
       it 'userが紐づいてないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it 'category_idの値が1だと保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it 'quality_idの値が1だと保存できない' do
        @item.quality_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Quality must be other than 1')
      end

      it 'shipping_charge_idの値が1だと保存できない' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping charge must be other than 1')
      end

      it 'delivery_date_idの値が1だと保存できない' do
        @item.delivery_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date must be other than 1")
      end

      it 'area_idの値が0だと保存できない' do
        @item.area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Area must be other than 0')
      end
    end
  end
end