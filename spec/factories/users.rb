FactoryBot.define do 
  factory :user do
    nickname {Faker::JapaneseMedia::OnePiece.character}
    age {Faker::Number.between(from: 16, to: 40)}
    gender_id {Faker::Number.between(from: 2, to: 3)}
    email {Faker::Internet.free_email}
    password {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1,)}
    password_confirmation {password}
  end
end