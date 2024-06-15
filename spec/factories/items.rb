FactoryBot.define do
  factory :item do
    name            { 'テストアイテム' }
    content         { 'テスト内容' }
    category_id     { 3 }
    condition_id    { 3 }
    load_id         { 3 }
    area_id         { 3 }
    delivery_id     { 3 }
    price           { 500 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/item-sample.png'), filename: 'test_image.png')
    end
  end
end
