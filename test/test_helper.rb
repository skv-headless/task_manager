ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

#TODO FIXME разобратся почему не работает адаптер(проблема с иерархией)
#require 'wrong/adapters/minitest'

require 'coveralls'
Coveralls.wear!('rails')

FactoryGirl.reload

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  include Wrong

  def failure_class
    MiniTest::Assertion
  end

  def aver(valence, explanation = nil, depth = 0)
    self._assertions += 1 # increment minitest's assert count
    super(valence, explanation, depth + 1) # apparently this passes along the default block
  end


  include FactoryGirl::Syntax::Methods
  include Concerns::AuthManagement
end
