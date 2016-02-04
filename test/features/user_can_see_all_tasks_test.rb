require_relative '../test_helper'

class UserCanSeeAllTasksTest < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_lists_all_tasks_that_have_been_created_for_a_user
    create_tasks(3)
    visit '/tasks'

    assert_equal '/tasks', current_path

    within('h1') { assert page.has_content? "All Tasks" }
    assert page.has_content? "stuff 1"
    assert page.has_content? "stuff 2"
    assert page.has_content? "stuff 3"
  end
end
