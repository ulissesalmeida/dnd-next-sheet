require 'test_helper'

class RacesHelperTest < ActionView::TestCase
  include RacesHelper

  test 'should format the abilities score' do
    traits = traits_for(ability_scores: { con: 1, dex: 2, str: 3 })

    assert_equal(['Constitution + 1, Dexterity + 2, and Strength + 3'], traits)
  end

  test 'should format the age range' do
    traits = traits_for(age_range: (1..10))

    assert_equal(['Became mature when reach the age of 1. They can live about 10 years.'], traits)
  end
end
