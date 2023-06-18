RSpec.describe '/groups' do
  # This should return the minimal set of attributes required to create a valid
  # Group. As you add validations to Group, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      name: 'group name',
      description: 'description'
    }
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  let(:user) { create(:user) }
  let!(:group) { create(:group, user:) }

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      get groups_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get group_url(group)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_group_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      get edit_group_url(group)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Group' do
        expect do
          post groups_url, params: { group: valid_attributes }
        end.to change(Group, :count).by(1)
      end

      it 'redirects to the created group' do
        post groups_url, params: { group: valid_attributes }
        expect(response).to redirect_to(group_url(Group.last))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          name: 'new',
          description: 'lasting'
        }
      end

      it 'updates the requested group' do
        patch group_url(group), params: { group: new_attributes }
        group.reload
        expect(group.name).to eq 'new'
      end

      it 'redirects to the group' do
        patch group_url(group), params: { group: new_attributes }
        group.reload
        expect(response).to redirect_to(group_url(group))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested group' do
      expect do
        delete group_url(group)
      end.to change(Group, :count).by(-1)
    end

    it 'redirects to the groups list' do
      delete group_url(group)
      expect(response).to redirect_to(groups_url)
    end
  end
end
