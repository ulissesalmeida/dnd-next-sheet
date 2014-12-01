class RacesController < ApplicationController
  def index
    @races = Race.all
  end

  def show
    @races = Race.all
    @race = Race.find_by_slug(params[:id])
  end

  def create
    race = Race.find_by_slug(params[:id])
    cookies[:race_name] = race[:name]
    cookies[:race_slug] = race[:slug]
    cookies.delete :race_variant_name
    cookies.delete :race_variant_slug

    redirect_to race_path(params[:id])
  end
end
