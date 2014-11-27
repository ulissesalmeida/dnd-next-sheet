class RaceVariantsController < ApplicationController
  def show
    @races = Race.all
    @race = Race.find_by_slug(params[:race_id])
    @race_variant = Race.find_variant_by_slug(@race[:slug], params[:id])
  end

  def create
    if cookies[:race_slug].present?
      @race_variant = Race.find_variant_by_slug(cookies[:race_slug], params[:id])    
      if (@race_variant != nil)
        cookies[:race_variant_name] = @race_variant[:name]
        cookies[:race_variant_slug] = @race_variant[:slug]    
        cookies.delete :class_name
        cookies.delete :class_slug
        cookies.delete :background_name
        cookies.delete :background_slug

        redirect_to character_classes_path
        return
      else
        cookies.delete :race_name
        cookies.delete :race_slug
      end
    end

    redirect_to :back
  end
end
