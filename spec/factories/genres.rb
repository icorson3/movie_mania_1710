FactoryBot.define do
  factory :genre do
    sequence(:name) {|n| "Romance#{n}"}
  end
end
