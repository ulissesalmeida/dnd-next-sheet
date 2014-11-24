require 'test_helper'

class BackgroundsHelperTest < ActionView::TestCase
  include GeneralItemsHelper

  test 'should return the skill proficiencies description' do
    description = background_traits_for(skill_proficiencies: [:religion, :insight]).first

    assert_equal(['Skill Proficiencies', 'Religion and Insight'], description)
  end

  test 'should return the languages choosable quantity description' do
    description = background_traits_for(languages_quantity: 2).first

    assert_equal(['Languages', '2 of your choice'], description)
  end

  test 'should return the tool proficiencies description' do
    description = background_traits_for(tool_proficiencies: [:disguise_kit, :one_type_of_musical_instrument]).first

    assert_equal(['Tool Proficiencies', 'Disguise Kit and One Type Of Musical Instrument'], description)
  end

  test 'should format the coin pouch' do
    coins = format_coin_pouch(gp: 10, sp: 5, xx: 10)

    assert_equal(['5 sp', '10 gp'], coins)
  end
end
