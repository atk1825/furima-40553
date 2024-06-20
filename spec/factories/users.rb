FactoryBot.define do
  factory :user do
    id                    { 1 }
    nickname              { Faker::Name.initials(number: 3) }
    email                 { Faker::Internet.email }
    password              { 'aaa111' }
    password_confirmation { password }
    family_name           { 'テスト名字' }
    first_name            { 'テスト名前' }
    family_name_zenkaku   { 'テスト' }
    first_name_zenkaku    { 'テスト' }
    birth                 { Faker::Date.birthday }
  end
end
