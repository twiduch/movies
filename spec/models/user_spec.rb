RSpec.describe User do
  let(:user) { create(:user) }

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'creates active group' do
    expect(user.reload.active_group).to be_persisted
  end
end
