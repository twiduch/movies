RSpec.describe 'Dashboard' do
  describe 'GET /index' do
    let!(:user) { create(:user) }

    context 'when user logged in' do
      before do
        post sessions_path, params: { user_id: user.id }
      end

      it 'responds 200 code' do
        get dashboard_index_path
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
