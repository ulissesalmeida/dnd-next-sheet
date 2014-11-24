require 'test_helper'

class BackgroundsHelperTest < ActionView::TestCase
  include GeneralItemsHelper

  test 'should return the skill proficiencies description for given background' do
    description = background_traits_for(skill_proficiencies: [:religion, :insight]).first

    assert_equal(['Skill Proficiencies', 'Religion and Insight'], description)
  end
end
