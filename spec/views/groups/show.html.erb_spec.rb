require 'rails_helper'

RSpec.describe 'groups/show' do
  let(:group) { create(:group, :with_user) }

  before do
    assign(:group, group)
  end

  it 'renders attributes in <p>' do
    render

    expect(rendered).to match(/name/)
    expect(rendered).to match(/description/)
  end
end
