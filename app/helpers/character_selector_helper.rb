module CharacterSelectorHelper
  def character_sheet
    if cookies[:character_sheet]
      JSON.parse(cookies[:character_sheet])
    else
      {}
    end
  end

  def race_link
    race = Race.find_by_slug(character_sheet["race_slug"])
    link_to race[:name], race_path(race[:slug])
  end

  def race_variant_link
    race_variant = Race.find_variant_by_slug(character_sheet["race_slug"], character_sheet["race_variant_slug"])
    link_to race_variant[:name], race_variant_path(race_variant[:slug], race_id: character_sheet["race_slug"])
  end

  def class_link
    character_class = CharacterClass.find_by_slug(character_sheet["character_class_slug"])
    link_to character_class[:name], character_class_path(character_class[:slug])
  end

  def background_link
    background = Background.find_by_slug(character_sheet["background_slug"])
    link_to background[:name], background_path(background[:slug])
  end
end
