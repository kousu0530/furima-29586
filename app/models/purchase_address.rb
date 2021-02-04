class PurchaseAddress
   include ActiveModel::Model
   attr_accessor :postal_code, :tell, :area, :city, :prefectures, :apartment, :user_id, :product_id

   with_options presence: true do
     validates :postal_code, format:{with:/\A\d{3}[-]\d{4}\z/}
     validates :prefectures
     validates :city
     validates :area
     validates :tell, format:{with:/\A[0-9]+\z/}, length: {maximum: 11}
    
   end
   validates :prefectures, numericality: { other_than: 0, message: "can't be blank" }

   def save
     order = Order.create(user_id: user_id, product_id: product_id)
     Destination.create( postal_code: postal_code, prefectures: prefectures, city: city, area: area, apartment: apartment, tell: tell, :purchase_id, purchase_id)
   end
 end