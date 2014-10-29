require 'test_helper'

class CharacterClassTest < ActiveSupport::TestCase
  test 'should return all classes' do
    character_classes = CharacterClass.all
    character_classes_slug = character_classes.map { |character_class| character_class[:slug] }

    assert_equal(1, character_classes.size)
    assert_equal([:barbarian], character_classes_slug)
  end

  test 'should find by slug' do
    character_class = CharacterClass.find_by_slug(:barbarian)

    assert_equal('Barbarian', character_class[:name])
  end
end
