class RacesController < ApplicationController
  def index
    @races = Race.all
  end

  def show
    @races = Race.all
    @race = Race.find_by_slug(params[:id])
  end

  def create
    race_slug = params[:races][:race_slug].to_sym
    cookies[:race_slug] = race_slug

    redirect_to race_path(race_slug)
  end
end
