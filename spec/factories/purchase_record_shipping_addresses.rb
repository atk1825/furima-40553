FactoryBot.define do
  factory :purchase_record_shipping_address do
    post_number      { '111-1111' }
    area_id          { 2 }
    municipality     { 'テスト' }
    street_address   { 'テスト' }
    building_name    { 'テスト' }
    telephone_number { '11122223333' }
    token            {"tok_abcdefghijk00000000000000000"}
  end
end
