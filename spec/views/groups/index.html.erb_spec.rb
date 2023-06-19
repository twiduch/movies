RSpec.describe 'groups/index' do
  let(:user) { create(:user) }

  before do
    assign(:groups, user.groups)
    allow(view).to receive(:current_user).and_return(user)
  end

  it 'renders index' do
    render

    expect(rendered).to match(/New group/)
  end
end
