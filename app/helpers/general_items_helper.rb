module GeneralItemsHelper
  ABILITY_MAP = {
    'str' => 'Strength',
    'dex' => 'Dexterity',
    'con' => 'Constitution',
    'int' => 'Inteligence',
    'wis' => 'Wisdom',
    'cha' => 'Charisma'
  }.with_indifferent_access

  def equipments_description_for(resource)
    format_equipments(Array(resource[:equipments])) +
      format_equipments_options(Array(resource[:equipment_options]))
  end

  def format_equipments(equipments)
    equipments.map do |equipment|
      format_equipment(equipment)
    end
  end

  def format_equipments_options(options)
    options.map { |option| format_choosable_equipments(option) }
  end

  def format_choosable_equipments(option)
    quantity = option[:quantity]
    items_sentence = format_equipments(option[:items]).to_sentence

    "Choose #{quantity} from #{items_sentence}"
  end

  def format_equipment(equipment)
    pluralize(equipment[:quantity], format_item(equipment[:item]))
  end

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
        item == 'any' ? 'One extra of your choice' : format_item(item)
      end.to_sentence
    end
  end

  def format_item(item)
    item.humanize.titleize
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
