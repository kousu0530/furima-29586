FactoryBot.define do
  factory :item do
    
    name           { 'カメラ' }
    explanation  { 'カメラです'}
    category_id         { 2 }
    quality_id   { 2 }
    price               { 300 }
    shipping_charge_id    { 2 }
    area_id             { 1 }
    delivery_date_id { 2 }
    
    association :user
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/IMG_1882.PNG'), filename: 'IMG_1882.PNG')
    end
  end
end