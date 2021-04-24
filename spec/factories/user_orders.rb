FactoryBot.define do
  factory :user_order do
    prefecture_id  { 2 }
    post_code      { '123-4567' }
    area_city      { 'あああああ' }
    area2_address  { '22222' }
    area3_building { '333' }
    phone_number   { '08012345678' }
    token          { 'tok_abcdefghijk00000000000000000' }
  end
end
