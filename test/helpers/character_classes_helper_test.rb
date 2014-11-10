require 'test_helper'

class CharacterClassesHelperTest < ActionView::TestCase
  include GeneralItemsHelper
  include CharacterClassesHelper

  test 'should format the hit dice information' do
    features = class_features_for(hit_dice: :d12)

    assert_equal(
      [
        ['Hit Dice', '1d12 per level'],
        ['Hit Points at 1st Level', '12 + your Constitution modifier'],
        ['Hit Points at Hifher Levels', '1d12(or 7) + your Constitution modifier per level after 1st']
      ], features)
  end
end
