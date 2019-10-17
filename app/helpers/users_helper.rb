module UsersHelper
  def user_status user
    user.invitation_accepted? ?
      content_tag(:span, 'accepted') :
      'Invitation pending'
  end
end
