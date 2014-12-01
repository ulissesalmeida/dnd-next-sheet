class CharacterClassesController < ApplicationController
  def index
    @character_classes = CharacterClass.all
  end

  def show
    @character_classes = CharacterClass.all
    @character_class = CharacterClass.find_by_slug(params[:id])
  end

  def create
    character_class_slug = params[:character_classes][:class_slug].to_sym
    cookies[:class_slug] = character_class_slug

    redirect_to backgrounds_path
  end
end
