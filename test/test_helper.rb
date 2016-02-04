ENV["RACK_ENV"] ||= "test"

require File.expand_path('../../config/environment', __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'capybara/dsl'
require 'tilt/erb'

Capybara.app = TaskManagerApp
Capybara.save_and_open_page_path = "tmp/capybara"

module TestHelpers
  def teardown
    task_manager.delete_all
    super
  end

  def create_task
    data = { title: "a title", description: "a description" }
    task_manager.create(data)
  end

  def create_tasks(num)
    num.times do |i|
      task_manager.create({
        title: "stuff #{i + 1}",
        description: "description #{i + 1}"
      })
    end
  end

  def task_manager
    database = YAML::Store.new('db/task_manager_test')
    @task_manager ||= TaskManager.new(database)
  end
end
