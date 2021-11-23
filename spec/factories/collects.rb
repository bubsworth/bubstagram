FactoryBot.define do
  factory :collect do
    user
    post
    saved { false }
  end
end
