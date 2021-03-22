FactoryBot.define do
  factory :user do
    nickname { Faker::JapaneseMedia::OnePiece.character }
    email { Faker::Internet.free_email }
    password { 'tamu777' }
    password_confirmation { password }
    last_name { '田村' }
    first_name { '一生' }
    last_name_k { 'タムラ' }
    first_name_k { 'イッセイ' }
    birth { Faker::Date.in_date_period(year: 1990) }
  end
end
