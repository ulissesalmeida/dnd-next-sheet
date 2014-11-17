class CharacterClass
  class << self
    def all
      ALL_CLASSES
    end

    def find_by_slug(slug)
      ALL_CLASSES_BY_SLUG[slug.to_s]
    end
  end

  BARBARIAN = {
    name: 'Barbarian',
    slug: :barbarian,
    description: "<p> The barbarians are defined by their rage: unbridled, "\
      "unquenchable, and unthinking fury. More than a mere emotion, their "\
      "anger is the ferocity of a cornered predator, the unrelenting assault "\
      "of a storm, the churning turmoil of the sea.</p>"\
      "<p> For some, their rage springs from a communion with fierce animal "\
      "spirits. Others draw from a roiling reservoir of anger at a world full "\
      "of pain. For every barbarian, rage is a power that fuels nos just a "\
      "battle frenzy but also uncanny reflexes, resilience, and feats of "\
      "strength.</p>",
    proficiency_bonus: 2,
    hit_dice: :d12,
    armor_proficiences: [:light, :medium, :shield],
    weapon_proficiences: [:simple, :martial],
    saving_throw_proficiences: [:str, :con],
    tools_proficiences: [],
    skills_proficiences_option: {
      quantity: 2,
      items: [:animal_handling, :athletics, :intimidation, :nature,
        :perception, :survival]
    },
    equipment_options: [
      {
        quantity: 1,
        items: [
          { item: :greataxe, quantity: 1 },
          { item: :any_melee_martial_weapon, quantity: 1 }
        ]
      },
      {
        quantity: 1,
        items: [
          { item: :handaxe, quantity: 2 },
          { item: :any_simple_weapon, quantity: 1}
        ]
      }
    ],
    equipments: [
      { item: :explorer_pack, quantity: 1 },
      { item: :javelin, quantity: 4 }
    ],
    class_features: [
      {
        level: 1,
        name: 'Rage',
        description: 'On your turn, you can enter a rage as bonus action.
                      While ranging you gain...'
      },
      {
        level: 1,
        name: 'Unarmored defense',
        description: 'While you are not wearing any armor, your Armor Class equals
                      10 + your Dexterity modifier + your Constitution modifier.
                      You can use a shield and gain this benefit.'
      }
    ],
    rage_power: {
      damage: 2,
      times_before_rest: 2
    }
  }

  ALL_CLASSES = [BARBARIAN]
  ALL_CLASSES_BY_SLUG = ALL_CLASSES.index_by { |characer_class| characer_class[:slug].to_s }
end
