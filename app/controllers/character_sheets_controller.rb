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

  private

  def character_sheet
    @character_sheet ||= begin
      attributes = cookies[:character_sheet] ? JSON.parse(cookies[:character_sheet]) : {}
      CharacterSheet.new(attributes)
    end
  end

  def save_character_sheet
    cookies[:character_sheet] = character_sheet.to_json
  end
end
