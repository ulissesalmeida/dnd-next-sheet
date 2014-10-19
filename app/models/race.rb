class Race
  class << self
    def all
      ALL_RACES
    end

    def find_by_slug(slug)
      ALL_RACES_BY_SLUG[slug.to_s]
    end

    def find_variant_by_slug(race_slug, variant_slug)
      ALL_RACES_BY_SLUG[race_slug.to_s][:race_variants].find { |variant| variant[:slug].to_s == variant_slug.to_s }
    end
  end

  DWARF = {
    name: 'Dwarf',
    slug: :dwarf,
    ability_scores: { con: 2 },
    age_range: (50..350),
    recommended_alignments: [:lawful, :good],
    game_size: :medium,
    speed: 25,
    weapon_proficiences: [:battleaxe, :handaxe, :throwing_hammer, :warhammer],
    distinct_tool_proficiences: [:smith, :brewer, :mason],
    languages: [:common, :dwarvish],
    race_powers: [
      {
        name: 'Dwarven Resilience',
        description: 'You have advantage on saving throws against poison, and
          you have resistance against poison damage.'
      },
      {
        name: 'Stonecunning',
        description: 'Whenever you make an Intelligence(History) check related
          to the origin of stonework, you are considered proficient in the
          History skill and add double your proficiency bonus to the check,
          instead of your normal proficiency bonus'
      }
    ],
    race_variants: [
      {
        name: 'Hill Dwarf',
        slug: :hill_dwarf,
        ability_scores: { wis: 1 },
        extra_hit_points_per_level: 1
      },
      {
        name: 'Mountain Dwarf',
        slug: :mountain_dwarf,
        ability_scores: { str: 2 },
        armor_proficiences: [:light, :medium]
      }
    ]
  }

  ELF = {
    name: 'Elf',
    slug: :elf,
    ability_scores: { dex: 2 },
    age_range: (100..750),
    alignemnt: [:chaotic, :good],
    game_size: :medium,
    speed: 30,
    skill_proficiences: [:perception],
    languages: [:common, :elvish],
    race_powers: [
      {
        name: 'Darkvision',
        description: 'You can see in dim light within 60 feet of you as if
          it were bright light, and in darkness as if it were dim light.'
      },
      {
        name: 'Fey Ancestry',
        description: 'You have advantage on saving throws against being
          charmed, and magic can’t put you to sleep.'
      },
      {
        name: 'Trance',
        description: 'Elves don’t need to sleep.Instead,they meditate deeply,
          remaining semiconscious, for 4 hours a day.'
      }
    ],
    race_variants: [
      {
        name: 'High Elf',
        slug: :high_elf,
        ability_scores: { int: 1 },
        weapon_proficiences: [ :longsword, :shortsword, :shortbow, :longbow],
        race_spells: {
          ability: :int,
          cantrips: [:a_wizard_cantrip]
        },
        languages: [:any]
      },
      {
        name: 'Wood Elf',
        slug: :wood_elf,
        ability_scores: { wis: 1 },
        weapon_proficiences: [ :longsword, :shortsword, :shortbow, :longbow],
        speed: 35, #It overrides the default elf speed
        race_powers: [
          {
            name: 'Mask of the Wild',
            description: 'You can attempt to hide even when you are only
              lightly obscured by foliage, heavy rain, falling snow, mist, and
              other natural phenomena'
          }
        ]
      },
      {
        name: 'Dark Elf (Drow)',
        slug: :dark_elf,
        ability_scores: { cha: 1 },
        weapon_proficiences: [ :rapier, :shortsword, :hand_crossbow],
        race_powers: [
          {
            name: 'Superior Darkvision',
            description: 'Your darkvision has radius of 120 feet.'
          },
          {
            name: 'Sunlight Sensitivity',
            description: 'You have disvantage on attack  rolls and on
              Wisdom(Perception) checks that rely on sight when you, the target,
              of your attack, or whatever you are trying to perceive is in direct
              sunlight.'
          }
        ],
        race_spells: {
          ability: :cha,
          cantrips: [:dancing_lights],
          levels: [
            {
              level: 3,
              times_per_day: 1,
              spells: [:faerie_fire]
            },
            {
              level: 5,
              times_per_day: 1,
              spells: [:darkness]
            }
          ]
        }
      }
    ]
  }

  HALFLING = {
    name: 'Halfling',
    slug: :halfling,
    ability_scores: { dex: 2 },
    age_range: (20..150),
    recommended_alignments: [:lawful, :good],
    game_size: :small,
    speed: 25, #feet
    languages: [:common, :halfling],
    race_powers: [
      {
        name: 'Lucky',
        description: "When you roll a 1 on an attack roll, ability check, or
          saving throw, you can reroll the die and must use the new roll."
      },
      {
        name: 'Brave',
        description: "You have advantage on saving throws against being frightened."
      },
      {
        name: 'Halfing Nimbleness',
        description: "You can move through the space of any creature that is
          of a size larger than yours."
      }
    ],
    race_variants: [
      {
        name: 'Lightfoot',
        slug: :lightfoot,
        ability_scores: { cha: 1 },
        race_powers: [
          {
            name: 'Naturally Stealthy',
            description: "You can attempt to hide even when you are obscured
              only by a create hatat is at least one size larger than you."
          }
        ]
      },
      {
        name: "Stout",
        slug: :stout,
        ability_scores: { con: 1 },
        race_powers: [
          {
            name: "Stout Resilience",
            description: "You have advantage on saving throws against poison,
              and you have resitance against poison damage."
          }
        ]
      }
    ]
  }

  HUMAN = {
    name: 'Human',
    slug: :human,
    description: "In the reckonings of most worlds, humans are the youngest of the common
      races, late to arrive on the world scene and short-lived in comparison
      to dwarves, elves, and dragons. Perhaps it is because of their shorter
      lives that they strive to achieve as much as they can in the years they
      are given. Or maybe they feel they have something to prove to the elder
      races, and that's why they build their mighty empires on the foundation
      of conquest and trade. Whatever drives them, humans are innovators, the
      achievers, and the pioneers of the worlds.",
    languages: [:common, :any],
    speed: 30, #foot
    game_size: :medium,
    recommended_alignments: :any,
    age_range: (15..100),
    race_variants: [
      {
        name: 'Your ability scores each increase by 1.',
        slug: :all_abilities_score,
        ability_scores: { str: 1, dex: 1, con: 1, cha: 1, wis: 1, int: 1 },
      },
      {
        name: 'Two ability scores of your choice increase by 1, one skill proficiency, one feat.',
        slug: :skill_and_feat,
        distinct_ability_scores: 2,
        skill_proficiences: [:any],
        feats: [:any]
      }
    ]
  }

  ALL_RACES = [DWARF, ELF, HALFLING, HUMAN]
  ALL_RACES_BY_SLUG = ALL_RACES.index_by { |race| race[:slug].to_s }
end
