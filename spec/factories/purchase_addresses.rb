FactoryBot.define do
  factory :purchase_address do
    postal_code { '123-4567' }
    prefectures { 1 }
    city { '横浜市緑区' }
    area_id { '青山1-1-1' }
    apartment {'柳ビル103'}
    tell {'09012345678'}
    token {"tok_e1f38e25de8ea4ab352115db62c9"}
  end
end
