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
      flash.now[:error] = @sock.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @sock = Sock.find(params[:id])
  end

  def update
    @sock = Sock.find(params[:id])
    if @sock.update_sock(sock_params)
      flash[:success] = "Successfully updated sock!"
      redirect_to admin_socks_path
    else
      flash.now[:error] = @sock.errors.full_messages.join(", ")
      render :edit
    end
  end
  private

  def sock_params
    params.require(:sock).permit(:name, :price, :image_url, :foot, :style, :category, :size)
  end
end
