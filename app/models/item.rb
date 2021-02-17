class Item < ApplicationRecord
   belongs_to :user
    has_one :purchase
  has_one_attached :image
  accepts_nested_attributes_for  allow_destroy: true

   
   extend ActiveHash::Associations::ActiveRecordExtensions
   belongs_to :area
   belongs_to :category
   belongs_to :delivery_date
   belongs_to :quality
   belongs_to :shipping_charge

   with_options numericality: { other_than: 1 } do
    validates :category_id        
    validates :quality_id
    validates :shipping_charge_id
    validates :shipping_charge_id
    validates :delivery_date_id
   end

   with_options presence: true do
     validates :name
     validates :explanation
     validates :price,  numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
     validates :area_id,            numericality: { other_than: 0 }
     validates :image
   end

   def was_attached?
    self.image.attached?
  end
 end
