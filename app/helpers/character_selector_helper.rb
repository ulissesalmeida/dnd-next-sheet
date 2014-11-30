module CharacterSelectorHelper
  def race_link    
    if cookies[:race_slug].present?
      link_to cookies[:race_name], race_path(cookies[:race_slug])
    end
  end

  def race_variant_link
    if cookies[:race_slug].present? && cookies[:race_variant_slug].present?
      link_to cookies[:race_variant_name], 
        race_variant_path(cookies[:race_variant_slug], race_id: cookies[:race_slug])
    end
  end

  def class_link
    if cookies[:class_slug].present?
      link_to cookies[:class_name], character_class_path(cookies[:class_slug])
    end
  end

  def background_link
    if cookies[:background_slug].present?
      link_to cookies[:background_name], background_path(cookies[:background_slug])
    end
  end
end