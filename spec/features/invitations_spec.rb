require 'rails_helper'

describe 'invitations' do
  let(:admin) { create :user }
  let(:employee) { 'employee@test.com' }

  it 'shows invitations after invite a user' do
    login_as admin
    visit users_path
    fill_in 'Email', with: employee
    click_on 'Invite'

    expect(page).to have_content 'An invitation email has been sent'
    expect(page).to have_content employee
    expect(page).to have_content 'Invitation pending'
  end

  it 'can accept an user invitation' do
    invite = User.invite!({ email: employee, admin_id: admin.id}, admin)
    raw_token = invite.instance_variable_get(:@raw_invitation_token)
    visit accept_user_invitation_path(invitation_token: raw_token)
    
    fill_in 'Name', with: 'Employee name'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_on 'Set my password'
    
    expect(page).to have_content 'Your password was set successfully. You are now signed in.'

    logout

    login_as admin
    visit users_path

    within 'table' do
      expect(page).to have_content 'Employee name employee@test.com accepted'
    end
  end
end