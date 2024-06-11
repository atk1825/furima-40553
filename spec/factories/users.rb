FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 3) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name           { Faker::Name.initials(number: 2) }
    first_name            { Faker::Name.initials(number: 2) }
    family_name_zenkaku   { "テスト" }
    first_name_zenkaku    { "テスト" } 
    birth                 { Faker::Date.birthday}
  end
end
