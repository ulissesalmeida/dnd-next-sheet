class Background
  class << self
    def all
      ALL_BACKGROUNDS
    end

    def find_by_slug(slug)
      ALL_BACKGROUNDS_BY_SLUG[slug.to_s]
    end
  end

  ACOLYTE = {
    slug: :acolyte,
    name: 'Acolyte',
    description: '',
    skill_proficiencies: [:insight, :religion],
    equipment: [
      { item: :holy_symbol, quantity: 1 },
      { item: :prayer_book, quantity: 1 },
      { item: :sticks_of_incense, quantity: 5 },
      { item: :vestments, quantity: 1 },
      { item: :common_clothes, quantity: 1 },
    ],
    money: {
      gold: 15,
    },
    feature: {
      name: 'Shelter of the Faithful',
      description: ''
    }
  }

  ALL_BACKGROUNDS = [ACOLYTE]
  ALL_BACKGROUNDS_BY_SLUG = ALL_BACKGROUNDS.index_by { |background| background[:slug].to_s }
end
