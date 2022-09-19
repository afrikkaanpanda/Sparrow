FactoryBot.define do
  factory :user do
    first_name { "alando" }
    last_name { "wilson" }
    username { "panda.god" }
    email    { "alando.willo@gmail.com" }
    password_digest { "Password" }
  end
end
