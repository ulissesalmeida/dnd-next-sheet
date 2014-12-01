module CharacterSelectorHelper
  def race_link
    race = Race.find_by_slug(cookies[:race_slug])
    link_to race[:name], race_path(race[:slug])
  end

  def race_variant_link
    race_variant = Race.find_variant_by_slug(cookies[:race_slug], cookies[:race_variant_slug])
    link_to race_variant[:name], race_variant_path(race_variant[:slug], race_id: cookies[:race_slug])
  end

  def class_link
    character_class = CharacterClass.find_by_slug(cookies[:class_slug])
    link_to character_class[:name], character_class_path(character_class[:slug])
  end

  def background_link
    background = Background.find_by_slug(cookies[:background_slug])
    link_to background[:name], background_path(background[:slug])
  end
end
