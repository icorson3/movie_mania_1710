FactoryBot.define do

  factory :director do
    sequence(:name) {|n| "Director#{n}"}
  end



  factory :director_with_movies, class: :director do
    name "My name"
    transient do
      movie_count 3
    end

    after(:create) do |director, evaluator|
      create_list(:movie, evaluator.movie_count, director: director)
    end
  end
end
