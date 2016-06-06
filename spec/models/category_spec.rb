require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @category = Category.create!(name:'Name', description: 'Something')
  end
  describe 'Category' do
      it 'should return top categories' do
        expect(Category.top_categories).to eq([@category])
      end

  end
end
