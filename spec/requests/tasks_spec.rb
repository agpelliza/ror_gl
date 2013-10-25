require 'spec_helper'

describe "Tasks" do
  
  before do
    @task = Task.new :task => 'complete this example'
    @task.save
  end

  describe "GET /tasks" do
    it "displays some tasks" do
      visit tasks_path
      expect(page).to have_content 'complete this example'
    end

    it "creates a new task" do
      visit tasks_path
      fill_in 'Task', :with => 'update this example'
      click_button 'Create Task'

      current_path.should == tasks_path
      expect(page).to have_content 'update this example'
    end
  end

  describe "PUT /tasks" do
    it "edits a task" do
      visit tasks_path
      click_link 'Edit'

      current_path.should == edit_task_path(@task)

      find_field('Task').value.should == 'complete this example'

      fill_in 'Task', :with => 'updated task'
      click_button 'Update Task'

      current_path.should == tasks_path

      expect(page).to have_content 'updated task'

    end

    it "should not update an empty task" do
      visit tasks_path
      click_link 'Edit'

      fill_in 'Task', :with => ''
      click_button 'Update Task'

      current_path.should == edit_task_path(@task)
      expect(page).to have_content 'There was an error updating your task.'
    end
  end

  describe "DELETE /tasks" do
    it "should delete a task" do
      visit tasks_path
      find("#task_#{@task.id}").click_link 'Delete'
      expect(page).to have_content 'Task has been deleted'
      expect(page).to have_no_content 'complete this example'
    end
  end
end