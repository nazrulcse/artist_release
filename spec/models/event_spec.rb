require 'rails_helper'

RSpec.describe Event, type: :model do
  before(:each) do
    @event = Event.create!(title: 'Awesome meeting',date: '12/12/2016',country:'Bangladesh', location:'Mirpur')
  end
  describe 'Event' do
    it 'Should return long address' do
      expect(@event.long_address).to eq(@event.location)
    end
    it 'Should return short address' do
      expect(@event.short_address).not_to eq(nil)
      expect(@event.short_address).to eq(@event.country)
    end

  end
end
