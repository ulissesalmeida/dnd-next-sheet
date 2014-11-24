module BackgroundsHelper
  def background_traits_for(background)
    [
      label_and_value('Skill Proficiencies', format_items(background[:skill_proficiencies])),
      label_and_value('Languages', format_choosable_quantity(background[:languages_quantity]))
    ].select(&:present?)
  end

  def format_choosable_quantity(quantity)
    if quantity
      "#{quantity} of your choice"
    end
  end
end
