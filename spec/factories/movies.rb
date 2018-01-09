FactoryBot.define do
  factory :movie do
    # sequence(:title) {|n| "Mary Poppins #{n}"}
    title "Mary P"
    description "Practically perfect in every way"
    rating 76
    director
  end
end
