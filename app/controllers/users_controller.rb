class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      if @cart.contents.count > 0
        redirect_to cart_path
      else
        redirect_to dashboard_path
      end
    else
      flash[:error] = @user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end

  def show
    if current_user
      @user = current_user
    else
      render file: 'public/404'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params) && @user.admin?
      redirect_to admin_dashboard_path
    elsif @user.update(user_params)
      redirect_to dashboard_path
    else
      flash.now[:error] = @user.errors.full_messages.join(", ")
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :password, :password_confirmation)
  end
end
