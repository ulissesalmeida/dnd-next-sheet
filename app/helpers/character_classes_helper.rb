module CharacterClassesHelper
  MAX_DICE_VALUE = {
    'd12' => 12,
    'd10' => 10,
    'd8'  => 8,
    'd6'  => 6,
    'd4'  => 4,
    'd3'  => 3,
    'd2'  => 2
  }

  def hit_points_descritption_for(character_class)
    [
      label_and_value('Hit Dice', format_hit_dice(character_class[:hit_dice])),
      label_and_value('Hit Points at 1st Level', format_hp_first_level(character_class[:hit_dice])),
      label_and_value('Hit Points at Hifher Levels', format_hp_higher_levels(character_class[:hit_dice]))
    ].select(&:present?)
  end

  def proficiencies_descritption_for(character_class)
    [
      label_and_value('Armor', format_items(character_class[:armor_proficiencies])),
      label_and_value('Weapons', format_items(character_class[:weapon_proficiencies])),
      label_and_value('Saving Throws', format_abilities(character_class[:saving_throw_proficiencies])),
      label_and_value('Skills', format_choosable_items(character_class[:skills_proficiencies_option]))
    ].select(&:present?)
  end

  def character_class_level_format(character_class_level)
    [
      character_class_level[:level],
      format_bonus(character_class_level[:proficiency_bonus]),
      format_items(character_class_level[:features]),
      character_class_level[:rages],
      format_bonus(character_class_level[:rage_damage])
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
