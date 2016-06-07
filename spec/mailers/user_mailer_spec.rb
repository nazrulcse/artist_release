require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  before(:each) do
    @user = User.create!(email: 'raihan@gmail.com', password: '123456789',first_name: 'Raihan',last_name: 'xyz')
  end
  describe 'send_welcome_email' do
    let(:mail) { UserMailer.send_welcome_email(@user) }
    it 'Should check email address' do
      expect(mail.subject).to eq('Welcome To New Artist Release')
      expect(mail.to).to eq([@user.email])
    end
  end
end