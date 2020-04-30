FactoryBot.define do
  factory :user do
    name { "Michel Example" }
    sequence(:email) { |n| "michel_#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
    activated { true }
  end

  factory :other_user, class: User do
    name { "Mary Example" }
    sequence(:email) { |n| "mary_#{n}@exmple.com" }
    password { "foobar" }
    password_confirmation { "foobar" }
    activated { true }
  end

  factory :no_activation_user, class: User do
    name { "No Activation" }
    sequence(:email) { |n| "no_#{n}@activation.co.jp" }
    password { "foobar" }
    password_confirmation { "foobar" }
    activated { false }
  end
end
