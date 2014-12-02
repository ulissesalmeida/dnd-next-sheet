require 'test_helper'

class CharacterSheetTest < ActiveSupport::TestCase
  test 'should find the selected race' do
    sheet = CharacterSheet.new('race_slug' => 'elf')

    assert_equal(sheet.race[:name], 'Elf')
  end

  test 'should find the selected race variant' do
    sheet = CharacterSheet.new('race_slug' => 'elf', 'race_variant_slug' => 'dark_elf')

    assert_equal(sheet.race_variant[:name], 'Dark Elf (Drow)')
  end

  test 'should find the character class' do
    sheet = CharacterSheet.new('character_class_slug' => 'barbarian')

    assert_equal(sheet.character_class[:name], 'Barbarian')
  end

  test 'should find the selected background' do
    sheet = CharacterSheet.new('background_slug' => 'acolyte')

    assert_equal(sheet.background[:name], 'Acolyte')
  end
end
