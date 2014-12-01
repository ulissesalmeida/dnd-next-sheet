class RaceVariantsController < ApplicationController
  def show
    @races = Race.all
    @race = Race.find_by_slug(params[:race_id])
    @race_variant = Race.find_variant_by_slug(@race[:slug], params[:id])
  end

  def create
    race_variant_slug = params[:races][:race_slug].to_sym
    cookies[:race_variant_slug] = race_variant_slug

    redirect_to character_classes_path
  end
end
