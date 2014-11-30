class BackgroundsController < ApplicationController
  def index
    @backgrounds = Background.all
  end

  def show
    @backgrounds = Background.all
    @background = Background.find_by_slug(params[:id])
  end

  def create
    @background = Background.find_by_slug(params[:id])
    cookies[:background_name] = @background[:name]
    cookies[:background_slug] = @background[:slug]
    
    redirect_to root_path
  end
end
