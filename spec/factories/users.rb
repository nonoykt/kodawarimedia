FactoryBot.define do
  factory :user do
    name { "Michel Example" }
    email { "michel@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
