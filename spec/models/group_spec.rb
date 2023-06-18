RSpec.describe Group do
  let(:group) { build(:group, :with_user) }

  it 'is valid with valid attributes' do
    expect(group).to be_valid
  end
end
