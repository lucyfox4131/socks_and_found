class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_cart
  helper_method :current_user
  helper_method :current_admin?
  helper_method :invalid_login

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def set_cart
    @cart = Cart.new(session[:cart])
  end

  def current_twitter_user
    current_user && current_user.uid
  end

  def invalid_login
    flash.now[:error] = "Invalid login. Please try again."
    render :new
  end

  def route_by_user_role
    if @cart.contents.count > 0
      redirect_to cart_path
    elsif current_admin?
      redirect_to admin_dashboard_path
    else
      redirect_to dashboard_path
    end
  end
end
