module BackgroundsHelper
  AVAIABLE_COINS = [:cp, :sp, :ep, :gp, :pp]

  def background_traits_for(background)
    [
      label_and_value('Skill Proficiencies', format_items(background[:skill_proficiencies])),
      label_and_value('Languages', format_choosable_quantity(background[:languages_quantity])),
      label_and_value('Tool Proficiencies', format_items(background[:tool_proficiencies]))
    ].select(&:present?)
  end

  def format_choosable_quantity(quantity)
    if quantity
      "#{quantity} of your choice"
    end
  end

  def format_coin_pouch(coin_pouch)
    AVAIABLE_COINS.map do |coin|
      quantity = coin_pouch[coin]
      if quantity
        format_coin_and_quantity(coin, quantity)
      end
    end.select(&:present?)
  end

  def format_coin_and_quantity(coin, quantity)
    "#{quantity} #{coin}"
  end
end
