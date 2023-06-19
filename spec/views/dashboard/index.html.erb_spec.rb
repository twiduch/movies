RSpec.describe 'dashboard/index' do
  let(:user) { create(:user) }

  before do
    allow(view).to receive(:current_user).and_return(user)
  end

  it 'displays search input' do
    render
    expect(rendered).to match(/input type="search"/)
  end
end
