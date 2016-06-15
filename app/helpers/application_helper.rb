module ApplicationHelper
  def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize
    presenter = klass.new(object, self)

    yield presenter if block_given?
    presenter
  end

  def user_button_display
    button_array = []
    if current_user
      button_array << link_to("Logout", logout_path, method: :delete)
      button_array << current_admin_display
    else
      button_array << link_to("Login", login_path)
      button_array << link_to("Login with Twitter", twitter_login_path)
    end
    return button_array
  end

  def current_admin_display
    if current_admin?
      link_to("Logged in as #{current_user.name}", admin_dashboard_path)
    else
      link_to("Logged in as #{current_user.name}", dashboard_path)
    end
  end
end
