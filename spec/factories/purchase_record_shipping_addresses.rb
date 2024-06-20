FactoryBot.define do
  factory :purchase_record_shipping_address do
    user_id          { 1 }
    item_id          { 1 }
    post_number      { '111-1111' }
    area_id          { 2 }
    municipality     { 'テスト' }
    street_address   { 'テスト' }
    building_name    { 'テスト' }
    telephone_number { '11122223333' }
  end
end
