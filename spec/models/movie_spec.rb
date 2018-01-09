describe Movie do
  it {should have_many :genre_movies}
  it {should have_many :genres}
end
