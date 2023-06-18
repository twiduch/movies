RSpec.describe 'Dashboard' do
  describe 'GET /index' do
    let(:user) { build(:user) }

    before do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end

    it 'responds 200 code' do
      get dashboard_index_path
      expect(response).to have_http_status(:ok)
    end
  end
end
