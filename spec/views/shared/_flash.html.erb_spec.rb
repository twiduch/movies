RSpec.describe 'shared/_flash' do
  before do
    allow(view).to receive(:notice).and_return('notice')
    allow(view).to receive(:alert).and_return('alert')
  end

  it 'displays notice' do
    render
    expect(rendered).to match(/notice/)
  end

  it 'displays alert' do
    render
    expect(rendered).to match(/alert/)
  end
end
