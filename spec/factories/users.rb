FactoryBot.define do
  factory :user do
    bio { "MyString" }
    name { "MyString" }
    password { "password" }
    password_confirmation { "password" }
    pronouns { "MyString" }
    sequence(:email) { |n| "user#{n}@example.com" }
    username { "MyString" }
  end
end
