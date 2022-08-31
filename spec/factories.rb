FactoryBot.define do

  factory :user do
    username { Faker::Internet.username }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end

  factory :book do
    title { Faker::Book.title }
    author { Faker::Book.author }
    cover_image_url { Faker::Internet.url }
    page_count { Faker::Number.number(digits: 3) }
    publisher { Faker::Book.publisher }
    synopsis { Faker::Lorem.paragraphs }
  end

  factory :list_item do
    book_id { "1" }
    owner_id { "1" }
    rating { Faker::Number.between(from: 1, to: 5) }
    notes { "test note" }
    start_date { Date.current }
    finish_date { Date.current + 1.day }
  end
end
