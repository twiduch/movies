RSpec.describe 'shared/_nav' do
  it 'displays user selection' do
    render
    expect(rendered).to match(/Select User/)
  end

  it 'displays app name' do
    render
    expect(rendered).to match(/Movies/)
  end
end
