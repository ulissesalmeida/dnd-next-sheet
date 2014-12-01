class RacesController < ApplicationController
  def index
    @races = Race.all
  end

  def show
    @races = Race.all
    @race = Race.find_by_slug(params[:id])
  end

  def create
    race_slug = params[:races][:race_slug]
    character_sheet  = JSON.parse(cookies[:character_sheet]) if cookies[:character_sheet].present?
    character_sheet[:race_slug] = race_slug
    character_sheet[:race_variant_slug] = nil
    cookies[:character_sheet] = character_sheet.to_json

    redirect_to race_path(race_slug)
  end
end
