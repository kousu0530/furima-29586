require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end

    context '商品が購入できる時' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_address).to be_valid
      end

      it 'apartmentは空でも保存できること' do
        @purchase_address.apartment = nil
        expect(@purchase_address).to be_valid
      end
    end
    
    
    context '商品が購入できない時' do
      it 'postal_codeが空では保存できないこと' do
        @purchase_address.postal_code = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeに-が入ってないと保存できないこと' do
        @purchase_address.postal_code = "1234567"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid")
      end

      it 'prefecturesが空では保存できないこと' do
        @purchase_address.prefectures = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefectures can't be blank")
      end

      it 'prefecturesの値が0では保存できないこと' do
        @purchase_address.postal_code = 0
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid")
      end

      it 'cityが空では保存できないこと' do
        @purchase_address.city = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end

      it 'area_idが空では保存できないこと' do
        @purchase_address.area_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Area can't be blank")
      end

      it 'tellが空では保存できないこと' do
        @purchase_address.tell = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Tell can't be blank")
      end

      it 'tellに-があると保存できないこと' do
        @purchase_address.tell = "123-456-789"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Tell is invalid")
      end

      it 'tellが12文字以上では保存できないこと' do
        @purchase_address.tell = "123456789012"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Tell is too long (maximum is 11 characters)")
      end

      it "tokenが空では登録できないこと" do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
