FactoryBot.define do

  factory :admin, class: :director do
    sequence(:name) {|n| "Director#{n}"}
  end

  factory :director do
    sequence(:name) {|n| "Director#{n}"}
  end
end
