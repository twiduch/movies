RSpec.describe 'groups/edit' do
  let(:group) { create(:group, :with_user) }

  before do
    assign(:group, group)
  end

  it 'renders the edit group form' do
    render

    expect(rendered).to match(/name="group\[name\]"/)
    expect(rendered).to match(/name="group\[description\]"/)
  end
end
