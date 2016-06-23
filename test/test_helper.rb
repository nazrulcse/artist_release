require 'simplecov'

ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"

SimpleCov.start do
  # add_filter 'test/'
  # add_filter 'config/'
  # add_filter 'vendor/'

  add_group 'Controllers', 'app/controllers'
  add_group 'Models', 'app/models'
  add_group 'Helpers', 'app/helpers'
  add_group 'Mailers', 'app/mailers'
  add_group 'Views', 'app/views'
  add_group 'Uploaders', 'app/uploaders'
end if ENV["RAILS_ENV"] = "test"

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # Add more helper methods to be used by all tests here...
  include FactoryGirl::Syntax::Methods
  #include Devise::TestHelpers
end

class ActionController::TestCase
  include Devise::TestHelpers
end
