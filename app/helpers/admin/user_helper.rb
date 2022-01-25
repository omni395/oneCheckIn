module Admin::UserHelper
  def full_name(user)
    user.first_name.to_s + " " + user.middle_name.to_s + " " + user.last_name.to_s
  end
end
