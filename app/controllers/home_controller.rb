class HomeController < ApplicationController
  def show
    @name = current_user.name.capitalize unless !current_user
  end
end
