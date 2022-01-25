module ApplicationHelper
  def toastr_flash
    flash.each_with_object([]) do |(type, message), flash_messages|
      type = 'success' if type == 'notice'
      type = 'error' if type == 'alert'
      text = "<script>toastr.#{type}('#{message}', '')</script>"
      flash_messages << text.html_safe if message
    end.join("\n").html_safe
  end

  def avatar(user, width, height, avatar_class)
    if user.avatar.attached?
      image_tag(user.avatar, :width => width, :height => height, :class => avatar_class)
    else
      image_tag("avatar_default.png", :width => width, :height => height, :class => avatar_class)
    end
  end
end
