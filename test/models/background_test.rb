require 'test_helper'

class BackgroundTest < ActiveSupport::TestCase
  test 'should return all backgrounds' do
    bakcgrounds = Background.all
    bakcgrounds_slug = bakcgrounds.map { |background| background[:slug] }

    assert_equal(1, bakcgrounds.size)
    assert_equal(['acolyte'], bakcgrounds_slug)
  end

  test 'should find by slug' do
    background = Background.find_by_slug('acolyte')

    assert_equal('Acolyte', background[:name])
  end
end
