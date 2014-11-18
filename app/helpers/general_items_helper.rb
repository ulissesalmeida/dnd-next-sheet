module GeneralItemsHelper
  ABILITY_MAP = {
    str: 'Strength',
    dex: 'Dexterity',
    con: 'Constitution',
    int: 'Inteligence',
    wis: 'Wisdom',
    cha: 'Charisma'
  }

  def label_and_value(label, value)
    if value
      [label, value]
    end
  end

  def format_bonus(value)
    if value
      "+#{value}"
    end
  end

  def format_items(items)
    if items
      items.map do |item|
        item == :any ? 'One extra of your choice' : format_item(item)
      end.to_sentence
    end
  end

  def format_item(item)
    item.to_s.humanize.titleize
  end

  def format_ability(ability)
    ABILITY_MAP[ability]
  end

  def format_abilities(abilities)
    if abilities
      abilities.map { |ability| format_ability(ability) }.to_sentence
    end
  end

  def format_choosable_items(option)
    if option
      quantity = option[:quantity]
      items_sentence = format_items(option[:items])

      "Choose #{quantity} from #{items_sentence}"
    end
  end
end
