require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = FactoryGirl.create(:category)
  end
    test 'should return top categories' do
      assert_operator Category.top_categories.length, :>= ,1
    end
end
