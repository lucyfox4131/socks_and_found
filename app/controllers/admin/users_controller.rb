class Admin::UsersController < Admin::BaseController
  def show
    @admin = current_user
  end
end
