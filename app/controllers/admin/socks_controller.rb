class Admin::SocksController < Admin::BaseController
  def index
    @socks = Sock.all
  end
end
