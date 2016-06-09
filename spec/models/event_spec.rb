require 'rails_helper'

RSpec.describe Event, type: :model do
  before(:each) do
    @event_with_country_state = Event.create!(title: 'Awesome meeting',date: '12/12/2016',country:'Bangladesh', state:'Dhaka',location:'Mirpur')
    @event_with_country = Event.create!(title: 'Awesome meeting',date: '12/12/2016',country:'Bangladesh', location:'Mirpur')
    @event_with_state = Event.create!(title: 'Awesome meeting',date: '12/12/2016',state:'Bangladesh', location:'Mirpur')
    @event_without_country_state = Event.create!(title: 'Awesome meeting',date: '12/12/2016', location:'Mirpur')

  end
  describe 'Event' do
    it 'Should return short address with country and address' do
      expect(@event_with_country_state.short_address).not_to eq(nil)
      expect(@event_with_country_state.short_address).to eq(@event_with_country_state.country << ', ' << @event_with_country_state.state)
    end

    it 'Should return short address with country' do
      expect(@event_with_country.short_address).not_to eq(nil)
      expect(@event_with_country.short_address).to eq(@event_with_country.country)
    end

    it 'Should return short address with state' do
      expect(@event_with_state.short_address).not_to eq(nil)
      expect(@event_with_state.short_address).to eq(@event_with_state.state)
    end

    it 'Should return short address without country and state' do
      expect(@event_without_country_state.short_address).not_to eq(nil)
      expect(@event_without_country_state.short_address).to eq(@event_without_country_state.location)
    end

    it 'Should return long address' do
      expect(@event_with_country_state.long_address).to eq(@event_with_country_state.location)
    end

  end
end
