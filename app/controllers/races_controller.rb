class RacesController < ApplicationController
  def index
    @races = Race.all
  end

  def show
    @races = Race.all
    @race = Race.find_by_slug(params[:id])
  end
end
