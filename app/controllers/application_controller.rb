class ApplicationController < ActionController::Base
  helper_method :character_sheet

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def character_sheet
    @character_sheet ||= begin
      attributes = cookies[:character_sheet] ? JSON.parse(cookies[:character_sheet]) : {}
      CharacterSheet.new(attributes)
    end
  end
end
