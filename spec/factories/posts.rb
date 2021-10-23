FactoryBot.define do
  factory :post do
    caption {Faker::Lorem.sentence}
    category_id {Faker::Number.between(from: 2, to: 13)}
    association :user
    after(:build) do |post|
      post.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end