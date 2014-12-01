class CharacterClassesController < ApplicationController
  def index
    @character_classes = CharacterClass.all
  end

  def show
    @character_classes = CharacterClass.all
    @character_class = CharacterClass.find_by_slug(params[:id])
  end

  def create
    character_class_slug = params[:character_classes][:class_slug]
    character_sheet  = JSON.parse(cookies[:character_sheet]) if cookies[:character_sheet].present?
    character_sheet[:class_slug] = character_class_slug
    cookies[:character_sheet] = character_sheet.to_json

    redirect_to backgrounds_path
  end
end
