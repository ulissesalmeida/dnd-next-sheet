class RaceVariantsController < ApplicationController
  def show
    @races = Race.all
    @race = Race.find_by_slug(params[:race_id])
    @race_variant = Race.find_variant_by_slug(@race[:slug], params[:id])
  end

  def create
    race_variant_slug = params[:races][:race_slug]
    character_sheet  = JSON.parse(cookies[:character_sheet]) if cookies[:character_sheet].present?
    character_sheet[:race_variant_slug] = race_variant_slug
    cookies[:character_sheet] = character_sheet.to_json

    redirect_to character_classes_path
  end
end
