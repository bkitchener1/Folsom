Then(/^I can see 'How to use my Projects' heading$/) do
  ProjectsListingPage.new.my_projects_howTo_title.verify_visible
end

And(/^I can see 4 Items in How to use My Projects section$/) do
  ProjectsListingPage.my_projects_howTo_items.verify_count(4)
end

And(/^I can see How to use my project Item Image$/) do
  MyProjectsHowTo.my_project_item_image.verify_visible
end

And(/^I can see How to use my projects Item Description$/) do
  MyProjectsHowTo.my_project_item_desc.verify_visible
end

Then(/^I can see that the current project is shown in the breadcrumb$/) do
  ProjectsListingPage.open_page.open_a_project_from_project_list(@project_name)
  ProjectDetailPage.breadcrumb_bar.verify_text(@project_name)
end

And(/^I open the project '(.*)' from Project List$/) do |project_name|
  ProjectsListingPage.open_page.open_a_project_from_project_list(project_name.upcase)
end

And(/^I create a New Project '(.*)' on the My Projects page$/) do |project_name|
  ProjectsListingPage.new.click_create_new_project_tile
  CreateProject.new.make_new_project project_name
end

Then(/^I can see that the Project '(.*)' has been created$/) do |project_name|
  ProjectsListingPage.open_page.verify_project project_name
end

When(/^I click 'New Project' Tile from Project Listing$/) do
  ProjectsListingPage.new.click_create_new_project_tile
end

And(/^I visit the Project Listings Page$/) do
  ProjectsListingPage.open_page
end

And(/^I can see sort controls$/) do
  ProjectsListingPage.new.sort_controls.verify_visible
end