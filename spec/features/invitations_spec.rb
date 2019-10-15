require 'rails_helper'

describe 'invitations' do
  let(:user) { create :user }

  before do
    login_as user
    visit users_path
  end

  it 'shows invitations after invite a user' do
    fill_in 'Email', with: 'grethel79@test.com'
    click_on 'Invite'

    # expect(page).to have_content 'Invitation email has been sent'
    expect(page).to have_content 'grethel79@test.com'
    expect(page).to have_content 'Invitation pending'
  end
end