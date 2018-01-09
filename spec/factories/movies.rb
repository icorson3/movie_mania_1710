FactoryBot.define do
  factory :movie do
    # sequence(:title) {|n| "Mary Poppins #{n}"}
    title "Mary P"
    description "Practically perfect in every way"
    director
  end

  factory :guardians, class: Movie do
    title "Guardians of the Galaxy"
    description "Fun & funny action movie"
    director
  end
end
