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
      proficiency_bonus: 2,
      armor_proficiences: [:light, :heavy],
      weapon_proficiences: [:simple, :martial],
      saving_throw_proficiences: [:str, :con]
    )

    assert_equal(
      [
        ['Proficience Bonus', '+ 2'],
        ['Armor', 'Light and Heavy'],
        ['Weapons', 'Simple and Martial'],
        ['Saving Throws', 'Strength and Constitution']
      ], features)
  end
end
