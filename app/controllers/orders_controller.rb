class OrdersController < ApplicationController
  def index
    if current_user
      @orders = current_user.orders
    else
      render file: "public/404"
    end
  end
end
