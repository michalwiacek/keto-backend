FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { FFaker::Internet.password(8) }
    
    after :create do |user|
      create_list :article, 3, user: user   # has_many
    end
  end
end
