FactoryBot.define do
  factory :article do
    title { FFaker::Book::title }
    main_image_background_hex_color {"#EEEEEE"}
    body_markdown { FFaker::LoremPL::paragraphs }
    association :user, factory: :user
  end
end
