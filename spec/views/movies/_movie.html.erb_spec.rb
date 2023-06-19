RSpec.describe 'movies/_movie' do
  let(:movie) { create(:movie) }

  before do
    render partial: 'movies/movie', locals: {:movie => movie}
  end

  it 'displays Title' do
    expect(rendered).to match(/Title.*#{movie.title}/m)
  end

  it 'displays Year' do
    expect(rendered).to match(/Year.*#{movie.year}/m)
  end

  it 'displays Plot' do
    expect(rendered).to match(/Plot.*#{movie.plot}/m)
  end

  it 'displays Type' do
    expect(rendered).to match(/Type.*#{movie.movie_type}/m)
  end
end
