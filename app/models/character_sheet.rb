class CharacterSheet
  attr_accessor :race_slug, :race_variant_slug, :character_class_slug,
    :background_slug

  def initialize(attributes)
    self.race_slug = attributes['race_slug']
    self.race_variant_slug = attributes['race_variant_slug']
    self.character_class_slug = attributes['character_class_slug']
    self.background_slug = attributes['background_slug']
  end

  def race
    Race.find_by_slug(race_slug)
  end

  def race_variant
    Race.find_variant_by_slug(race_slug, race_variant_slug)
  end

  def character_class
    CharacterClass.find_by_slug(character_class_slug)
  end

  def background
    Background.find_by_slug(background_slug)
  end
end
