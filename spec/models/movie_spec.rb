describe Movie, type: :model do
  it {should have_many(:genres).through(:genre_movies)}
  it {should belong_to :director}
end
