FactoryBot.define do
  factory :item do
    name               { Faker::Name.name }
    price              { Faker::Number.number(digits: 7) }
    explanation        { Faker::Team.creature }
    status_id          { 2 }
    category_id        { 2 }
    delivery_charge_id { 2 }
    delivery_area_id   { 2 }
    delivery_day_id    { 2 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
