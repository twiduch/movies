RSpec.describe GroupsHelper do
  let(:user) { create(:user) }
  let(:group) { create(:group, user:) }

  before do
    assign(:current_user, user)
  end

  describe '#active_group?' do
    it 'returns false if group is not active' do
      expect(helper.active_group?(group)).to be(false)
    end

    it 'returns true if group is active' do
      user.update(active_group: group)
      expect(helper.active_group?(group)).to be(true)
    end
  end
end
