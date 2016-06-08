class CartSocksController < ApplicationController

  def create
    @sock = Sock.find(params[:sock_id])
    redirect_to sock_path(@sock)
  end

  def show
  end

end
