FactoryBot.define do
  factory :purchase_address do
    postal_code { "123-4567" }
    delivery_from_id { 2 }
    city { "福岡" }
    street { "福岡市姪浜" }
    building { "アハマンション" }
    tel { "09012345678" }
    token { "tok_abcdefghijk00000000000000000" }
    user_id { 1 }
    item_id { 1 }
  end
end
