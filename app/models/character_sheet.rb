class CharacterSheet
  include ActiveModel::Model

  attr_accessor :age, :alignment, :background_slug, :backstory, :bond,
    :character_class_slug, :eyes, :flaw, :hair, :height, :ideal, :languages,
    :name, :personality_traits, :picture_url, :player_name, :race_slug,
    :race_variant_slug, :skin, :weight

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
