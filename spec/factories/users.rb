FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'1a'+Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {'てすといち'}
    last_name             {'てすとのに'}
    first_name_kana       {'テストイチ'}
    last_name_kana        {'テストノニ'}
    birthday              {'1930-01-01'}
  end
end