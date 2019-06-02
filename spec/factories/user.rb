FactoryBot.define do
  factory :user do
    name { "John" }
    email  { "test@email.com" }
    password { "password" }
    password_confirmation { "password" }
  end
  
  factory :user_2, class: User do
    name { "Jane" }
    email  { "test2@email.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end