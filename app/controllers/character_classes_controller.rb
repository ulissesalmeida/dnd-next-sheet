class CharacterClassesController < ApplicationController
  def index
    @character_classes = CharacterClass.all
  end

  def show
    @character_classes = CharacterClass.all
    @character_class = CharacterClass.find_by_slug(params[:id])
  end
end
