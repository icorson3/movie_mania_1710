FactoryBot.define do
  factory :movie do
    # sequence(:title) {|n| "Mary Poppins #{n}"}
    title "Mary P"
    description "Practically perfect in every way"
    director
    rating 4
  end
end
