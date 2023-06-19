RSpec.describe 'shared/_nav' do
  it 'displays user selection' do
    render
    expect(rendered).to match(/Select User/)
  end

  it 'displays Dashboard' do
    render
    expect(rendered).to match(%r{href="/dashboard">Dashboard})
  end

  it 'displays Groups' do
    render
    expect(rendered).to match(%r{href="/groups">Groups})
  end

  it 'displays app name' do
    render
    expect(rendered).to match(/Movies/)
  end
end
