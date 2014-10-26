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
      trait_with_label('Speed', format_speed(race[:speed])),
      trait_with_label('Weapon Proficiences', format_items(race[:weapon_proficiences])),
      trait_with_label('One tool proficiency of', format_items(race[:distinct_tool_proficiences])),
      trait_with_label('Languages', format_items(race[:languages])),
      trait_with_label('Extra HP per level', format_bonus(race[:extra_hit_points_per_level])),
      trait_with_label('Armor Proficiences', format_items(race[:armor_proficiences])),
      trait_with_label('Skill Proficiences', format_items(race[:skill_proficiences])),
      trait_with_label('Number of abilities increased by 1', race[:distinct_ability_scores]),
      trait_with_label('Feats', format_items(race[:feats]))
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
      "#{format_ability(ability)} + #{score}"
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
      alignment == :any ? 'Any alignment' : format_item(alignment)
    end.to_sentence
  end

  def format_game_size(game_size)
    if game_size
      format_item(game_size)
    end
  end

  def format_speed(speed)
    if speed
      "#{speed} feet"
    end
  end

  def format_bonus(value)
    if value
      "+ #{value}"
    end
  end

  def format_items(items)
    safe_items = Array(items)
    safe_items.map do |item|
      item == :any ? 'One extra of your choice' : format_item(item)
    end.to_sentence
  end

  def format_ability(ability)
    ABILITY_MAP[ability]
  end

  def format_item(item)
    item.to_s.humanize.titleize
  end
end
