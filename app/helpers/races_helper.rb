module RacesHelper
  ABILITY_MAP = {
    str: 'Strength',
    dex: 'Dexterity',
    con: 'Constitution',
    int: 'Inteligence',
    wis: 'Wisdom',
    cha: 'Charisma'
  }

  def traits_for(race)
    [
      format_abilities_scores(race[:ability_scores]),
      format_age_range(race[:age_range]),
      format_recommended_alignments(race[:recommended_alignments])
    ].select(&:present?)
  end

  def format_abilities_scores(ability_scores)
    safe_ability_scores = Hash(ability_scores)
    safe_ability_scores.map do |ability, score|
      "#{ABILITY_MAP[ability]} + #{score}"
    end.to_sentence
  end

  def format_age_range(age_range)
    if age_range
      "Became mature when reach the age of #{age_range.min}. They can live about #{age_range.max} years."
    end
  end

  def format_recommended_alignments(alignments)
    safe_alignments = Array(alignments)
    safe_alignments.map do |alignment|
      alignment == :any ? 'Any alignment' : alignment.to_s.titleize
    end.to_sentence
  end
end
