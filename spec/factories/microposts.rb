FactoryBot.define do
  factory :microposts, class: Micropost do
    trait :micropost_1 do
      content { "I love curry!" }
      picture { nil }
      user_id { 1 }
      created_at { 10.minutes.ago }
    end

    trait :micropost_2 do
      content { "I go to the coffee shop everyone" }
      picture { nil }
      user_id { 1 }
      created_at { 30.minutes.ago }
    end

    trait :micropost do
      content { "I read a book, the title of book is HOW_OBJECT_WORK " }
      picture { nil }
      user_id { 1 }
      created_at { 2.hours.ago }
    end

    trait :micropost_4 do
      content { "Programming makes me happy"}
      picture { nil }
      user_id { 1 }
      created_at { Time.zone.now }
    end
    association :user, factory: :user
  end
end
