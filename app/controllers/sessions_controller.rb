class SessionsController < ApplicationController

  def new
  end

  def create
    if params[:commit]
      @user = User.find_by(username: params[:session][:username])
      route_guest_or_user
    elsif @user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      invalid_login
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = "Goodbye!"
    redirect_to login_path
  end

  def route_guest_or_user
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      route_by_user_role
    else
      invalid_login
    end
  end
end
