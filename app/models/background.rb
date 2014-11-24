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
    description: "<p>You have sepen your life in the service of a temple to a "\
      "specific god or pantheon of gods. You act as an intermediary between "\
      "the realm of the holy and the mortal world, performing sacred rites "\
      "and offering sacrifices in order to conduct worshipers into the "\
      "presence of the the divine. You are not necessarily a cleric - "\
      "performing sacred rites is not the same thing as channeling divine "\
      "power.</p>",
    languages_quantity: 2,
    skill_proficiencies: [:insight, :religion],
    equipments: [
      { item: :holy_symbol, quantity: 1 },
      { item: :prayer_book, quantity: 1 },
      { item: :sticks_of_incense, quantity: 5 },
      { item: :vestment, quantity: 1 },
      { item: :common_cloth, quantity: 1 },
    ],
    coin_pouch: {
      gp: 15,
    },
    feature: {
      name: 'Shelter of the Faithful',
      description: "<p>As an acolyte, you command the respect those who share "\
        "your faith, and you can perform the religious ceremonies of your "\
        "deity. You and your adventuring companions can expect to receive "\
        "free healing and care at a temple, shrine, or other established "\
        "presence of your faith, though you must provide any material "\
        "components needed for spells. Those who sahre your religion will "\
        "support you(bunt only you) at a modest lifestyle.</p> "\
        "<p>You might also have ties to a specific temple dedicated to your "\
        "deity or pantheon, and you have residence there. This could be the "\
        "temple where you used to serve, if you remain on good term with it, "\
        "or a temple where you have found a new home. While near your temple, "\
        "you can call upon the priests for assistance, provided the assitance "\
        "you ask for is not hazardous and you remain in good standing with "\
        "your temple.</p>"
    }
  }

  ALL_BACKGROUNDS = [ACOLYTE]
  ALL_BACKGROUNDS_BY_SLUG = ALL_BACKGROUNDS.index_by { |background| background[:slug].to_s }
end
