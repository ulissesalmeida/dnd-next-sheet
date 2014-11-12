module CharacterClassesHelper
  MAX_DICE_VALUE = {
    :d12 => 12,
    :d10 => 10,
    :d8 => 8,
    :d6 => 6,
    :d4 => 4,
    :d3 => 3,
    :d2 => 2,
  }

  def hit_points_descritption_for(character_class)
    [
      label_and_value('Hit Dice', format_hit_dice(character_class[:hit_dice])),
      label_and_value('Hit Points at 1st Level', format_hp_first_level(character_class[:hit_dice])),
      label_and_value('Hit Points at Hifher Levels', format_hp_higher_levels(character_class[:hit_dice]))
    ].select(&:present?)
  end

  def proficiences_descritption_for(character_class)
    [
      label_and_value('Proficience Bonus', format_bonus(character_class[:proficiency_bonus])),
      label_and_value('Armor', format_items(character_class[:armor_proficiences]))
    ].select(&:present?)
  end

  def format_hit_dice(hit_dice)
    if hit_dice
      "1#{hit_dice} per level"
    end
  end

  def format_hp_first_level(hit_dice)
    if hit_dice
      "#{MAX_DICE_VALUE[hit_dice]} + your Constitution modifier"
    end
  end

  def format_hp_higher_levels(hit_dice)
    if hit_dice
      "1#{hit_dice}(or #{hp_alternative_for(hit_dice)})"\
      " + your Constitution modifier per level after 1st"
    end
  end

  def hp_alternative_for(hit_dice)
    (MAX_DICE_VALUE[hit_dice] / 2).floor + 1
  end
end
