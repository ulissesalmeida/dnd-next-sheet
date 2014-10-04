class Trait
  ABILITY_MAP = {
    str: 'Strength',
    dex: 'Dexterity',
    con: 'Constitution',
    int: 'Inteligence',
    wis: 'Wisdom',
    cha: 'Charisma'
  }

  def initialize(race = {}, race_variant = {})
    @race = race
    @race_variant = race_variant
  end

  def format
    [
      age,
      abilities_scores
    ].select(&:present?)
  end

  private

  def abilities_scores
    race_abilities = Hash(@race[:ability_scores])
    race_variant_abilities = Hash(@race_variant[:ability_scores])

    ability_scores = race_abilities.merge(race_variant_abilities) do |ability, race_score, variant_score|
      race_score + variant_score
    end

    ability_scores.map do |ability, score|
      "#{ABILITY_MAP[ability]} + #{score}"
    end.join(' | ')
  end

  def age
    age_range = @race[:age_range]
    if age_range
      "Became mature when reach the age of #{age_range.min}. They can live about #{age_range.max} years."
    end
  end
end
