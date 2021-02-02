class Item < ApplicationRecord
   belongs_to :user
  #  has_one :purchase
   
   
   
   extend ActiveHash::Associations::ActiveRecordExtensions
   belongs_to :area
   belongs_to :category
   belongs_to :delivery_date
   belongs_to :quality
   belongs_to :shipping_charge

   has_one_attached :image

  # 空の投稿を保存できないようにする
  validates :image, :name, :price, :explanation, :quality, :shipping_charge, :delivery_date, :area, :user, :category, presence: true

   with_options presence: true do
     validates :name
     validates :explanation
     validates :category_id,        numericality: { other_than: 1 }
     validates :quality_id,  numericality: { other_than: 1 }
     validates :price, presence: true,  numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
     validates :shipping_charge_id,   numericality: { other_than: 1 }
     validates :area_id,            numericality: { other_than: 0 }
     validates :delivery_date_id, numericality: { other_than: 1 }
     validates :image
   end
 end
