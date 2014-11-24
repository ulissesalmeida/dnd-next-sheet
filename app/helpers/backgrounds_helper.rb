module BackgroundsHelper
  def background_traits_for(background)
    [
      label_and_value('Skill Proficiencies', format_items(background[:skill_proficiencies]))
    ].select(&:present?)
  end
end
