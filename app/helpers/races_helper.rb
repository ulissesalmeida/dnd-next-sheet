module RacesHelper
  def traits_for(race)
    [
      label_and_value('Ability Scores', format_ability_scores(race[:ability_scores])),
      label_and_value('Age', format_age_range(race[:age_range])),
      label_and_value('Recomended alignments', format_recommended_alignments(race[:recommended_alignments])),
      label_and_value('Size', format_game_size(race[:game_size])),
      label_and_value('Speed', format_speed(race[:speed])),
      label_and_value('Weapon Proficiences', format_items(race[:weapon_proficiences])),
      label_and_value('Tool Proficiences', format_choosable_items(race[:tool_proficiences_option])),
      label_and_value('Languages', format_items(race[:languages])),
      label_and_value('Extra HP per level', format_bonus(race[:extra_hit_points_per_level])),
      label_and_value('Armor Proficiences', format_items(race[:armor_proficiences])),
      label_and_value('Skill Proficiences', format_items(race[:skill_proficiences])),
      label_and_value('Abilities increased by 1', format_choosable_abilities(race[:ability_scores_option])),
      label_and_value('Feats', format_items(race[:feats]))
    ].select(&:present?)
  end

  def format_ability_scores(ability_scores)
    if ability_scores
      ability_scores.map do |ability, score|
        "#{format_ability(ability)} + #{score}"
      end.to_sentence
    end
  end

  def format_age_range(age_range)
    if age_range
      "Became mature when reach the age of #{age_range.min}. They can live about #{age_range.max} years."
    end
  end

  def format_recommended_alignments(alignments)
    if alignments
      alignments.map do |alignment|
        alignment == :any ? 'Any alignment' : format_item(alignment)
      end.to_sentence
    end
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

  def format_choosable_abilities(option)
    if option
      quantity = option[:quantity]
      items_sentence = format_abilities(option[:items])

      "Choose #{quantity} from #{items_sentence}"
    end
  end
end
