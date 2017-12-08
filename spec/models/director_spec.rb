require "rails_helper"

describe Director, type: :model do
  it {should validate_presence_of(:name)}
end
