class BackgroundsController < ApplicationController
  def index
    @backgrounds = Background.all
  end

  def show
    @backgrounds = Background.all
    @background = Background.find_by_slug(params[:id])
  end
end
