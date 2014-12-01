class BackgroundsController < ApplicationController
  def index
    @backgrounds = Background.all
  end

  def show
    @backgrounds = Background.all
    @background = Background.find_by_slug(params[:id])
  end

  def create
    background_slug = params[:backgrounds][:background_slug].to_sym
    cookies[:background_slug] = background_slug

    redirect_to root_path
  end
end
