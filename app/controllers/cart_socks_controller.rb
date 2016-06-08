class CartSocksController < ApplicationController
  include ActionView::Helpers::TextHelper
  def create
    @sock = Sock.find(params[:sock_id])
    @cart.add_sock(@sock.id)
    session[:cart] = @cart.contents
    # cart = session[:cart] || {}
    # cart[@sock.id] ||= 0
    # cart[@sock.id] += 1
    # session[:cart] = cart
    flash[:notice] = "Your cart has 1 of #{@sock.name.pluralize(1)}."
    redirect_to sock_path(@sock)
  end

  def show
  end

end
