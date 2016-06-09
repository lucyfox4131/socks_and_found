class OrdersController < ApplicationController
  before_action :require_login

  def index
    @orders = current_user.orders
  end

  private

  def require_login
    unless current_user
      flash[:notice] = "You must be logged in to view this page."
      redirect_to login_path
    end
  end
end
