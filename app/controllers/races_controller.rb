class RacesController < ApplicationController
  def index
    @races = Race.all
  end
end
