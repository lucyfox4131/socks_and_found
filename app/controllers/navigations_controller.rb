class NavigationsController < ApplicationController

  def show
     category = Category.find_by(title: params[:navigation_title])
     style = Style.find_by(name: params[:navigation_title])
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
