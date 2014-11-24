require 'test_helper'

class BackgroundsHelperTest < ActionView::TestCase
  include GeneralItemsHelper

  test 'should return the skill proficiencies description for given background' do
    description = background_traits_for(skill_proficiencies: [:religion, :insight]).first

    assert_equal(['Skill Proficiencies', 'Religion and Insight'], description)
  end

  test 'should return the languages choosable quantity' do
    description = background_traits_for(languages_quantity: 2).first

    assert_equal(['Languages', '2 of your choice'], description)
  end
end
