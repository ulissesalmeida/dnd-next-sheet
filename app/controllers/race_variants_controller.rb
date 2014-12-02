class RaceVariantsController < ApplicationController
  def show
    @races = Race.all
    @race = Race.find_by_slug(params[:race_id])
    @race_variant = Race.find_variant_by_slug(@race[:slug], params[:id])
  end
end
