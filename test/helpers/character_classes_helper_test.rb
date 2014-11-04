require 'test_helper'

class CharacterClassesHelperTest < ActionView::TestCase
  include GeneralItemsHelper
  include CharacterClassesHelper

  test 'should format the hit dice' do
    features = class_features_for(hit_dice: :d12).first

    assert_equal(['Hit Dice', '1d12 per level'], features)
  end
end
