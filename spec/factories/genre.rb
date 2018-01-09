FactoryBot.define do
  factory :genre do
    sequence(:name) {|n| "Name#{n}"}
  end
end
