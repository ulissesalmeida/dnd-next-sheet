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
      trait_with_label('Ability Scores', format_ability_scores(race[:ability_scores])),
      trait_with_label('Age', format_age_range(race[:age_range])),
      trait_with_label('Recomended alignments', format_recommended_alignments(race[:recommended_alignments])),
      trait_with_label('Size', format_game_size(race[:game_size])),
      trait_with_label('Speed', format_speed(race[:speed]))
    ].select(&:present?)
  end

  def trait_with_label(label, value)
    if value.present?
      [label, value]
    end
  end

  def format_ability_scores(ability_scores)
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

  def format_game_size(game_size)
    if game_size
      game_size.to_s.titleize
    end
  end

  def format_speed(speed)
    if speed
      "#{speed} feet"
    end
  end
end
