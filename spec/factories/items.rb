FactoryBot.define do
  factory :item do
    name { 'a' }
    description { 'a' }
    category_id { 2 }
    status_id { 2 }
    delivery_fee_id { 2 }
    delivery_from_id { 2 }
    delivery_day_id { 2 }
    price { 300 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/hero.jpg'), filename: 'hero.jpg')
    end
  end
end
