require 'spec_helper'

describe "Tasks" do
  describe "GET /tasks" do
    it "displays some tasks" do
      @task = Task.create :task => 'complete this example'

      visit tasks_path
      page.should have_content 'complete this example'
    end

    it "creates a new task" do
      visit tasks_path
      fill_in 'Task', :with => 'update this example'
      click_button 'Create Task'

      current_path.should == tasks_path
      page.should have_content 'update this example'

      save_and_open_page
    end
  end
end