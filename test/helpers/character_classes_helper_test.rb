require 'test_helper'

class CharacterClassesHelperTest < ActionView::TestCase
  include GeneralItemsHelper
  include CharacterClassesHelper

  test 'should return the hit points descritption for given hit dice' do
    features = hit_points_descritption_for(hit_dice: :d12)

    assert_equal(
      [
        ['Hit Dice', '1d12 per level'],
        ['Hit Points at 1st Level', '12 + your Constitution modifier'],
        ['Hit Points at Hifher Levels', '1d12(or 7) + your Constitution modifier per level after 1st']
      ], features)
  end

  test 'should return proficiences descritptions for given class' do
    features = proficiences_descritption_for(
      armor_proficiences: [:light, :heavy],
      weapon_proficiences: [:simple, :martial],
      saving_throw_proficiences: [:str, :con],
      skills_proficiences_option: {
        quantity: 2,
        items: [:animal_handling, :athletics]
      }
    )

    assert_equal(
      [
        ['Armor', 'Light and Heavy'],
        ['Weapons', 'Simple and Martial'],
        ['Saving Throws', 'Strength and Constitution'],
        ['Skills', 'Choose 2 from Animal Handling and Athletics']
      ], features)
  end

  test 'should format the equipment descritption for given class' do
    descriptions = equipments_description_for(
      equipments: [
        { item: :javelin, quantity: 1 },
        { item: :javelin, quantity: 4 }
      ],
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
      ]
    )

    assert_equal(
      [
        '1 Javelin',
        '4 Javelins',
        'Choose 1 from 1 Greataxe and 1 Any Melee Martial Weapon',
        'Choose 1 from 2 Handaxes and 1 Any Simple Weapon'
      ],
      descriptions
    )
  end
end
