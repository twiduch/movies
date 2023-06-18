RSpec.describe Omdb::SearchService do
  let(:service) { described_class }
  let(:term) { 'search' }
  let(:omdb_search) { File.open('spec/fixtures/omdb_search.json') }
  let(:response) { service.call(term) }

  before do
    stub_request(:get, "https://www.omdbapi.com/?apikey=12345&s=#{term}")
      .to_return(status: 200, body: omdb_search, headers: {})
  end

  it 'returns array of objects' do
    expect(response.size).to eq 10
  end

  it 'returns parsed objects' do
    expect(response.first.Title).to eq 'The Lord of the Rings: The Return of the King'
  end
end
