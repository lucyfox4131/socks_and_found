class HomeController < ApplicationController
  def show
    @name = User.display_name(current_user)
  end
end
