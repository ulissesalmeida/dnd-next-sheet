class BackgroundsController < ApplicationController
  def index
    @backgrounds = Background.all
  end

  def show
    @backgrounds = Background.all
    @background = Background.find_by_slug(params[:id])
  end

  def create
    background_slug = params[:backgrounds][:background_slug]
    character_sheet  = JSON.parse(cookies[:character_sheet]) if cookies[:character_sheet].present?
    character_sheet[:background_slug] = background_slug
    cookies[:character_sheet] = character_sheet.to_json

    redirect_to root_path
  end
end
