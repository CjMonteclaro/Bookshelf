FactoryBot.define do
  
  factory :user do
    username {"test"}
    email {"test@gmail.com"}
    password {"password123"}
  end

  factory :book do
    title {"Book1"}
    author {"Test Author"}
    cover_image_url {"https://images-na.ssl-images-amazon.com/images/I/41JodZ5Vl%2BL.jpg"}
    pageCount {"100"}
    publisher {"Test Publisher"}
    synopsis {"In ancient times the Rings of Power were crafted by the Elven-smiths, and Sauron, the Dark Lord, forged the One Ring, filling it with his own power so that he could rule all others. But the One Ring was taken from him, and though he sought it throughout Middle-earth, it remained lost to him. After many ages it fell by chance into the hands of the hobbit Bilbo Baggins."}
  end

  factory :list_item do
    book_id {"1"}
    owner_id {"1"}
    rating {"3"}
    notes {"test note"}
    start_date {Date.today}
    finish_date {Date.today + 1}
  end

end