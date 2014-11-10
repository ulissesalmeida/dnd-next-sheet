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
      label_and_value('Ability Scores', format_ability_scores(race[:ability_scores])),
      label_and_value('Age', format_age_range(race[:age_range])),
      label_and_value('Recomended alignments', format_recommended_alignments(race[:recommended_alignments])),
      label_and_value('Size', format_game_size(race[:game_size])),
      label_and_value('Speed', format_speed(race[:speed])),
      label_and_value('Weapon Proficiences', format_items(race[:weapon_proficiences])),
      label_and_value('One tool proficiency of', format_items(race[:distinct_tool_proficiences])),
      label_and_value('Languages', format_items(race[:languages])),
      label_and_value('Extra HP per level', format_bonus(race[:extra_hit_points_per_level])),
      label_and_value('Armor Proficiences', format_items(race[:armor_proficiences])),
      label_and_value('Skill Proficiences', format_items(race[:skill_proficiences])),
      label_and_value('Number of abilities increased by 1', race[:distinct_ability_scores]),
      label_and_value('Feats', format_items(race[:feats]))
    ].select(&:present?)
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
