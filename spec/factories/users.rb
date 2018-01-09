FactoryBot.define do
  factory :user do
    username "username"
    password "password"
  end

  factory :admin, class: User do
    username "admin"
    password "admin"
    role 1
  end
end
