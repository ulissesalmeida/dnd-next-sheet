module CharacterClassesHelper
  def class_features_for(character_class)
    [
      trait_with_label('Hit Dice', format_hit_dice(character_class[:hit_dice]))
    ].select(&:present?)
  end

  def format_hit_dice(hit_dice)
    if hit_dice
      "1#{hit_dice} per level"
    end
  end
end
