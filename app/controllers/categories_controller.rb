class CategoriesController < ApplicationController

  def show
    @category = Category.find_by(title: params[:category_title])
    @socks = @category.socks
  end

end
