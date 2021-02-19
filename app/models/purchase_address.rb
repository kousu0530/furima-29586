class PurchaseAddress
   include ActiveModel::Model
   attr_accessor :postal_code, :tell, :area_id, :city, :prefectures, :apartment, :user_id, :product_id,:token, :item_id

   with_options presence: true do
     validates :postal_code, format:{with:/\A\d{3}[-]\d{4}\z/}
     validates :prefectures
     validates :city
     validates :area_id
     validates :tell, format:{with:/\A[0-9]+\z/}, length: {maximum: 11}
     validates :token
     validates :user_id
     validates :item_id
   end
   validates :prefectures, numericality: { other_than: 0, message: "can't be blank" }

   def save
     purchase = Purchase.create(user_id: user_id, item_id: item_id)
     Address.create( postal_code: postal_code, prefectures: prefectures, city: city, area_id: area_id, apartment: apartment, tell: tell, purchase_id: purchase.id)
   end
 end