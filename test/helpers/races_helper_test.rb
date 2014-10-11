require 'test_helper'

class RacesHelperTest < ActionView::TestCase
  include RacesHelper

  test 'should format the abilities score' do
    traits = traits_for(ability_scores: { con: 1, dex: 2, str: 3 }).first

    assert_equal(['Ability Scores', 'Constitution + 1, Dexterity + 2, and Strength + 3'], traits)
  end

  test 'should format the age range' do
    traits = traits_for(age_range: (1..10)).first

    assert_equal(['Age', 'Became mature when reach the age of 1. They can live about 10 years.'], traits)
  end

  test 'should format the recommended alignments' do
    traits = traits_for(recommended_alignments: [:any, :lawful]).first

    assert_equal(['Recomended alignments', 'Any alignment and Lawful'], traits)
  end

  test 'should format the game size' do
    traits = traits_for(game_size: :medium).first

    assert_equal(['Size', 'Medium'], traits)
  end

  test 'should format the speed' do
    traits = traits_for(speed: 30).first

    assert_equal(['Speed', '30 feet'], traits)
  end

  test 'should format the weapon proficiences' do
    traits = traits_for(weapon_proficiences: [:handaxe, :throwing_hammer]).first

    assert_equal(['Weapon Proficiences', 'Handaxe and Throwing Hammer'], traits)
  end

  test 'should format the distinct tools proficiences' do
    traits = traits_for(distinct_tool_proficiences: [:smith, :brewer]).first

    assert_equal(['One tool proficiency of', 'Smith and Brewer'], traits)
  end
end
