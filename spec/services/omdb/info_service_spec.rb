RSpec.describe Omdb::InfoService do
  let(:service) { described_class }
  let(:imdb_id) { 'tt1630029' }
  let(:omdb_info) { File.open('spec/fixtures/omdb_info.json') }
  let(:response) { service.call(imdb_id) }

  before do
    stub_request(:get, "https://www.omdbapi.com/?apikey=12345&i=#{imdb_id}")
      .to_return(status: 200, body: omdb_info, headers: {})
  end

  it 'returns parsed objects' do
    expect(response.Title).to eq 'Avatar: The Way of Water'
  end
end
