require 'rails_helper'

RSpec.describe 'groups/show' do
  let(:user) { create(:user) }

  context 'when showing active group, no movies' do
    let(:group) { user.active_group }

    before do
      assign(:group, group)
      assign(:movies, group.movies)

      allow(view).to receive(:current_user).and_return(user)
    end

    it 'renders Name' do
      render

      expect(rendered).to match(/Name.*#{group.name}/m)
    end

    it 'renders Description' do
      render

      expect(rendered).to match(/Description.*#{group.description}/m)
    end
  end
end
