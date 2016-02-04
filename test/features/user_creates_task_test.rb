require_relative '../test_helper'

class UserCreatesTaskTest < Minitest::Test
  include Capybara::DSL
  include TestHelpers

  def test_with_valid_attributes
    # As a user
    # When I visit the home page
    visit '/'
    # And I click "New task"
    click_link 'New Task'
    assert_equal '/tasks/new', current_path
    # And I fill in the title
    fill_in 'task[title]', with: 'Eat food'
    # And I fill in the description
    fill_in 'task[description]', with: 'All of it...'
    # And i click Submit
    click_button('Submit')
    # Then I should see my task
    assert_equal '/tasks', current_path
    assert page.has_content? 'Eat food'
  end
end
