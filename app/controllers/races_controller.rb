class RacesController < ApplicationController
  def index
    @races = [dwarf, elf, halfling, human]
  end

  def dwarf
    {
      name: 'Dwarf',
      ability_scores: [con: 2],
      age_range: (50..350),
      recommended_alignments: [:lawful, :good],
      size_range: (4..5), #foot,
      game_size: :medium,
      speed: 25, #foot
      weapon_proficiences: [:battleaxe, :handaxe, :thowing_hammer, :warhammer],
      distinct_tool_proficiences: [:smith, :brewer, :mason],
      languages: {
        start: [:common, :dwarvish]
      },
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
      subraces: [
        {
          name: 'Hill Dwarf',
          ability_scores: { wis: 1 },
          extra_hit_points_per_level: 1
        },
        {
          name: 'Mountain Dwarf',
          ability_scores: { str: 2 },
          armor_proficiences: [:light, :medium]
        }
      ]
    }
  end

  def elf
    {
      name: 'Elf',
      ability_scores: { dex: 2 },
      age_range: (100..750),
      alignemnt: [:chaotic, :good],
      game_size: :medium,
      size_range: (5..6), #feet
      speed: 30, #foot
      skill_proficiences: [:perception],
      languages: {
        start: [:common, :elvish]
      },
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
      subraces: [
        {
          name: 'High Elf',
          ability_scores: { int: 1 },
          weapon_proficiences: [ :longsword, :shortsword, :shortbow, :longbow],
          race_spells: {
            attribute: :int,
            cantrips: [:a_wizard_cantrip]
          },
          languages: [
            start: [:any]
          ]
        },
        {
          name: 'Wood Elf',
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
            attribute: :cha,
            can_trips: [:dancing_lights],
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
  end

  def halfling
    {
      name: 'Halfling',
      ability_scores: [dex: 2],
      age_range: [20..150],
      recommended_alignments: [:lawful, :good],
      size_range: (2.9..3.1), #feet
      game_size: :small,
      speed: 25, #feet
      languages: [
        start: [:common, :halfling]
      ],
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
      subraces: [
        {
          name: 'Lightfoot',
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
  end

  def human
    {
      name: 'Human',
      laguanges: {
        start: [:common, :any]
      },
      speed: 30, #foot
      game_size: :medium,
      size_range: (5..6), #feet
      recommended_alignments: :any,
      age_range: (15..100),
      variants: [
        {
          description: 'Your ability scores each increase by 1.',
          ability_scores: { str: 1, dex: 1, con: 1, cha: 1, wis: 1, int: 1 },
        },
        {
          description: 'Two, ability scores of your choice increase by 1, one skill proficiency, one feat.',
          distinct_ability_scores: 2,
        }
      ]
    }
  end
end
