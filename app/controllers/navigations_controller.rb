class NavigationsController < ApplicationController
  before_action

  def show
     category = Category.find_by_slug(params[:id])
     style = Style.find_by_slug(params[:id])

    #  byebug
     if category
       @title = category.title
       @socks = category.socks
     elsif style
       @title = style.name
       @socks = style.socks
     else
       render file: 'public/404'
     end
  end
end
