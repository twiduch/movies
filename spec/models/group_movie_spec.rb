require 'rails_helper'

RSpec.describe GroupMovie do
  let(:user) { create(:user) }
  let(:group) { user.active_group }
  let(:movie) { create(:movie) }

  before do
    group.movies << movie
  end

  it 'is raising error when duplicate entry' do
    expect { group.movies << movie }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
