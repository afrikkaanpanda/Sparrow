FactoryBot.define do
  factory :user do
    username { "willo" }
    email { "alando.willo@gmail.com" }
    password { "Password" }
    password_confirmation { "Password" }
  end
end
