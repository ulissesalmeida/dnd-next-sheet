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

  test 'shoud format the languages' do
    traits = traits_for(languages: [:common, :any]).first

    assert_equal(['Languages', 'Common and One extra of your choice'], traits)
  end

  test 'should format the extra hit points per level' do
    traits = traits_for(extra_hit_points_per_level: 2).first

    assert_equal(['Extra HP per level', '+ 2'], traits)
  end

  test 'should format the armor proficiences' do
    traits = traits_for(armor_proficiences: [:light, :heavy]).first

    assert_equal(['Armor Proficiences', 'Light and Heavy'], traits)
  end

  test 'should format the skill proficiences' do
    traits = traits_for(skill_proficiences: [:perception, :swim]).first

    assert_equal(['Skill Proficiences', 'Perception and Swim'], traits)
  end

  test 'should format the distinct ability scores' do
    traits = traits_for(distinct_ability_scores: 3).first

    assert_equal(['Number of abilities increased by 1', 3], traits)
  end

  test 'should format the feats' do
    traits = traits_for(feats: [:any, :weapon_focus]).first

    assert_equal(['Feats', 'One extra of your choice and Weapon Focus'], traits)
  end
end
