
And(/^I select the Project '(.*)' from Project list$/) do |project_name|
  SaveToMyProjects.new.select_project_from_project_list(project_name)
end

When(/^I save the Event to an Existing Project$/) do
  SaveToMyProjects.new.click_save_btn_to_add_to_selected_project
end
