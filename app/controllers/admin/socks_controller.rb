class Admin::SocksController < Admin::BaseController
  def index
    @socks = Sock.all
  end

  def new
    @sock = Sock.new
  end

  def create
    @sock = Sock.new_sock(sock_params)
    if @sock.save
      flash[:success] = "Successfully created new sock!"
      redirect_to admin_socks_path
    else
      flash.now[:error] #whatever error message goes here
      render :new
    end
  end

  private

  def sock_params
    params.require(:sock).permit(:name, :price, :foot, :style, :category, :size, :image_url)
  end
end
