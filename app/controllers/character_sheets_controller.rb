class CharacterSheetsController < ApplicationController
  def race_variant
    race_slug = params[:character_sheet][:race_slug]

    character_sheet.race_slug = params[:character_sheet][:race_slug]
    character_sheet.race_variant_slug = params[:character_sheet][:race_variant_slug]

    save_character_sheet

    redirect_to character_classes_path
  end

  def character_class
    character_class_slug = params[:character_sheet][:character_class_slug]

    character_sheet.character_class_slug = character_class_slug

    save_character_sheet

    redirect_to backgrounds_path
  end

  def background
    background_slug = params[:character_sheet][:background_slug]

    character_sheet.background_slug = background_slug

    save_character_sheet

    redirect_to root_path
  end

  def edit_details
  end

  def update_details
  end

  private

  def save_character_sheet
    cookies[:character_sheet] = character_sheet.to_json
  end
end
