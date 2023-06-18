RSpec.describe Movie do
  let(:movie) { build(:movie) }

  it 'is valid with valid attributes' do
    expect(movie).to be_valid
  end
end
