require_relative '../test_helper'

class UserUpdatesTaskTest < Minitest::Test
  include Capybara::DSL
  include TestHelpers

  def test_existing_task_is_updated_with_new_information
    create_task
    # As a user
    # When I visit the tasks page
    visit '/tasks'
    # And I click on 'Edit' link for "Run"
    click_link 'Edit'
    assert_equal '/tasks/1/edit', current_path
    # And I edit task[title]
    fill_in 'task[title]', with: 'Walk'
    # And I click 'Edit' button
    click_button 'Edit'
    # Then I should go to /tasks and see edited task
    assert_equal '/tasks', current_path
    assert page.has_content? 'Walk'
  end
end
