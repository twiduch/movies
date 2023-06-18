RSpec.describe 'groups/index' do
  before do
    assign(:groups, [])
  end

  it 'renders index' do
    render

    expect(rendered).to match(/New group/)
  end
end
