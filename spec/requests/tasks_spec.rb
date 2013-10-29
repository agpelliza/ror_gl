require 'spec_helper'

describe "Tasks" do
  
  before do
    @task = Task.create :task => 'First task'
  end

  describe "GET /tasks" do
    it "should have the content 'TODO List'" do
      visit tasks_path
      expect(page).to have_content('TODO List')
    end

    it "should display some tasks" do
      visit tasks_path
      expect(page).to have_content 'First task'
    end

    it "should create a new task" do
      visit tasks_path
      fill_in 'Task', :with => 'Second task'
      click_button 'Create Task'

      current_path.should == tasks_path
      expect(page).to have_content 'Second task'
    end
  end

  describe "PUT /tasks" do
    it "should edit a task" do
      visit tasks_path
      click_link 'Edit'

      current_path.should == edit_task_path(@task)

      find_field('Task').value.should == 'First task'

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
      expect(page).to have_no_content 'First task'
    end
  end

end
