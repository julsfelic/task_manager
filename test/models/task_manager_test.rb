require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  include TestHelpers

  def test_can_create_a_task
    create_task

    task = task_manager.all.last

    assert task.id
    assert_equal "a title", task.title
    assert_equal "a description", task.description
  end

  def test_can_get_all_tasks
    data1 = { title: "stuff 1", description: "More stuff 1" }
    data2 = { title: "stuff 2", description: "More stuff 2" }

    task_manager.create(data1)
    task_manager.create(data2)

    tasks = task_manager.all

    assert_instance_of Array, tasks
    tasks.each { |task| assert_instance_of Task, task }
    assert_equal 2, tasks.length
  end

  def test_can_find_task
    create_task

    # hard code 1 or below code?
    task = task_manager.find(task_manager.all.length)

    assert task.id
    assert_equal "a title", task.title
    assert_equal "a description", task.description
  end

  def test_can_update_task
    create_task

    task_manager.update({ "title" => "new title" }, 1)
    task = task_manager.find(1)

    assert task.id
    assert_equal "new title", task.title
    assert_equal "a description", task.description
  end

  def test_can_delete_task
    create_task

    task_manager.delete(1)
    tasks = task_manager.all

    assert_equal 0, tasks.length
  end
end
