class OrdersController < ApplicationController
  before_action :require_login

  def index
    @orders = current_user.orders
  end

  def show
    @order = current_user.orders.find(params[:id])
    @order_items = @order.order_items
  end

  def create
    order = Order.create(user_id: current_user.id, status: "ordered")
    order.create_order_items(@cart.contents)
    session.delete(:cart)
    flash[:success] = "Order was successfully placed"
    redirect_to "/orders"
  end

  private

  def require_login
    unless current_user
      flash[:notice] = "You must be logged in to view this page."
      redirect_to login_path
    end
  end
end
