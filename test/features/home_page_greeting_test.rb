require_relative '../test_helper'

class HomePageGreetingTest < Minitest::Test
  include Capybara::DSL

  def test_home_page_welcomes_user
    # As a user
    # When I visit the home page
    visit '/'
    # Then I see "Welcome to the TaskManager!"
    within("#greeting") do
      assert page.has_content? "Welcome to the Task Manager!"
    end
  end
end
