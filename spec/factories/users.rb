FactoryBot.define do
  factory :user do
    nickname                  { 'yamada' }
    email                     { Faker::Internet.free_email }
    password                  { 'a1a1a1a1' }
    password_confirmation     { password }
    last_name               { '山田' }
    first_name                { '陸太郎' }
    last_name_kana          { 'ヤマダ' }
    first_name_kana           { 'リクタロウ' }
    birthday                 { '1930-01-01' }
  end
end