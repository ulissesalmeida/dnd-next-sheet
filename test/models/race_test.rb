require 'test_helper'

class RaceTest < ActiveSupport::TestCase
  test 'should return all races' do
    races = Race.all
    races_slug = races.map { |race| race[:slug] }

    assert_equal(4, races.size)
    assert_equal([:dwarf, :elf, :halfling, :human], races_slug)
  end

  test 'should find by slug' do
    race = Race.find_by_slug(:human)

    assert_equal('Human', race[:name])
  end

  test 'should find the variant by slug' do
    variant = Race.find_variant_by_slug(:elf, :wood_elf)

    assert_equal('Wood Elf', variant[:name])
  end
end
