require 'test_helper'

class TraitTest < ActiveSupport::TestCase
  test 'should format the abilities score' do
    trait = Trait.new(ability_scores: { con: 1, dex: 2, str: 3 })

    assert_equal(['Constitution + 1 | Dexterity + 2 | Strength + 3'], trait.format)
  end

  test 'should sum the variant score' do
    race = { ability_scores: { con: 1, dex: 2 } }
    variant = { ability_scores: { str: 1, dex: 2 } }

    trait = Trait.new(race, variant)

    assert_equal(['Constitution + 1 | Dexterity + 4 | Strength + 1'], trait.format)
  end

  test 'should include the age range' do
    trait = Trait.new(age_range: (1..10))

    assert_equal(['Became mature when reach the age of 1. They can live about 10 years.'], trait.format)
  end
end
