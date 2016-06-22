require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @event_with_country_state = FactoryGirl.create(:event)
    @event_with_country = FactoryGirl.create(:event,state:nil)
    @event_with_state = FactoryGirl.create(:event,country:nil)
    @event_without_country_state = FactoryGirl.create(:event,country:nil, state:nil)
  end

  test 'Should return short address with country and address' do
    assert_not_equal @event_with_country_state.short_address, nil
    assert_equal @event_with_country_state.short_address, @event_with_country_state.country + ', ' + @event_with_country_state.state
  end

  test 'Should return short address with country' do
    assert_not_equal @event_with_country.short_address, nil
    assert_equal @event_with_country.short_address, @event_with_country.country
  end

  test 'Should return short address with state' do
    assert_not_equal @event_with_state.short_address, nil
    assert_equal @event_with_state.short_address, @event_with_state.state
  end

  test 'Should return short address without country and state' do
    assert_not_equal @event_without_country_state.short_address, nil
    assert_equal @event_without_country_state.short_address, @event_without_country_state.location
  end

  test 'Should return long address' do
    assert_equal @event_with_country_state.long_address, @event_with_country_state.location
  end
end
