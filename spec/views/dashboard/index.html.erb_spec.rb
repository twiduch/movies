RSpec.describe 'dashboard/index' do
  it 'displays search input' do
    render
    expect(rendered).to match(/input type="search"/)
  end
end
