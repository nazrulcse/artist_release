require 'rails_helper'
require 'carrierwave/test/matchers'

describe EventUploader do

  before(:each) do
    @event = Event.create!(title: 'Awesome meeting',date: '12/12/2016',country:'Bangladesh', state:'Dhaka',location:'Mirpur',image:Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'users', 'images', 'logo_image.png')))
  end


  let(:uploader) { EventUploader.new(@event, :image) }

  before(:each) do
    EventUploader.enable_processing = true
  end

  after(:each) do
    EventUploader.enable_processing = false
  end

  it "should return the store directory" do
    expect(uploader.store_dir).to eq('uploads/event/image/' <<@event.id.to_s)
  end
  it "should return the words list with spac" do
    expect(uploader.extension_white_list).to eq(%w[jpg jpeg gif png])
  end
end