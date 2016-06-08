class CartSocksController < ApplicationController
  include ActionView::Helpers::TextHelper
  def create
    sock = Sock.find(params[:sock_id])
    @cart.add_sock(sock.id)
    session[:cart] = @cart.contents
    flash[:notice] = "Your cart has #{@cart.count_of(sock.id)} of #{sock.name.pluralize(1)}."
    redirect_to sock_path(sock)
  end

  def show
  end

end
