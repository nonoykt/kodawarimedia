FactoryBot.define do
  factory :user do
    name { "Michel Example" }
    email { "michel@example.com" }
    password { "password" }
    password_confirmation { "password" }
    activated { true }
  end

  factory :other_user, class: User do
    name { "Mary Example" }
    email { "mary@exmple.com" }
    password { "foobar" }
    password_confirmation { "foobar" }
    activated { true }
  end

  factory :no_activation_user, class: User do
    name { "No Activation" }
    email { "no@activation.co.jp" }
    password { "foobar" }
    password_confirmation { "foobar" }
    activated { false }
  end
end
