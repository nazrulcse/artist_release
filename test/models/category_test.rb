require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = FactoryGirl.create(:category)
    @sub_category = FactoryGirl.create(:category, name: 'Rock', category_id: @category.id)
    @user = FactoryGirl.create(:user, is_approved: true, category_id: @category.id, sub_category_id: @sub_category.id)
  end
  test 'should return top categories' do
    assert_operator Category.top_categories.length, :>= ,1
  end
  test 'should return approved users' do
    #puts "<<<<<<<<<<<<<<<<"
    #puts @category.approved_profiles.inspect
    #puts "<<<<<<<<<<<<<<<<"

    assert_operator @sub_category.approved_profiles.length, :>=, 1
  end
end
