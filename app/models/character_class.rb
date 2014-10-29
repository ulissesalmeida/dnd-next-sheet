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
    proficiency_bonus: 2,
    hit_points_dice: :d12,
    hit_points_mean: 7,
    armor_proficiences: [:light_armor, :medium_armor, :shield],
    weapon_proficiences: [:simple, :martial],
    saving_throw_proficiences: [:str, :con],
    tools_proficiences: [],
    skills_proficiences_option: {
      quantity: 2,
      options: [:animal_handling, :athletics, :intimidation, :nature,
        :perception, :sruvival]
    },
    equipment_options: [
      {
        quantity: 1,
        options: [
          { item: :greataxe, quantity: 1 },
          { item: :any_martial_melee, quantity: 1 }
        ]
      },
      {
        quantity: 1,
        options: [
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
