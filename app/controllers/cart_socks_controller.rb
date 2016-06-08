class CartSocksController < ApplicationController
  include ActionView::Helpers::TextHelper
  def create
    sock = Sock.find(params[:sock_id])
    @cart.add_sock(sock.id)
    session[:cart] = @cart.contents
    flash[:notice] = "Your cart has #{@cart.count_of(sock.id)} of #{sock.name.pluralize(@cart.count_of(sock.id))}."
    redirect_to sock_path(sock)
  end

  def show
    @socks = @cart.socks
  end

  def destroy
    sock = Sock.find(params[:id])
    @cart.remove_sock(sock.id)
    link = %Q[<a href="/socks/#{sock.id}"> #{sock.name.pluralize(@cart.count_of(sock.id))}</a>]
    flash[:success] = "Successfully removed #{link} from your cart."
    redirect_to "/cart"
  end

  def update
    sock = Sock.find(params[:id])
    @cart.update_quantity(sock.id, params[:direction])
    redirect_to "/cart"
  end
end
