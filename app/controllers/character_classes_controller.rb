class CharacterClassesController < ApplicationController
  def index
    @character_classes = CharacterClass.all
  end

  def show
    @character_classes = CharacterClass.all
    @character_class = CharacterClass.find_by_slug(params[:id])
  end

  def create
    character_class = CharacterClass.find_by_slug(params[:id])
    cookies[:class_name] = character_class[:name]
    cookies[:class_slug] = character_class[:slug]

    redirect_to backgrounds_path
  end
end
