Then(/^I can see event listing on '(.*)' Detail page$/) do |arg|
  ProjectDetailPage.new.verify_project_is_displayed  arg
end

Then(/^I can see Reference Design listing on the Project Details page$/) do
  ProjectDetailPage.new.reference_designs.verify_visible
end

Then(/^I can see "([^"]*)" Reference Design listing on the Project Details page$/) do |arg|
  ProjectDetailPage.new.reference_designs.verify_count arg
end

Then(/^I can see "([^"]*)" Datasheet listing on Project Details page$/) do |arg|
  ProjectDetailPage.new.reference_designs.verify_count arg
end

And(/^I click Duplicate Project Image from Project Detail Page$/) do
  ProjectDetailPage.new.copy_project.click
end

And(/^I create a Duplicate project '(.*)'$/) do|project_name|
  @dup_project_name = CreateProject.new.generate_random_project_name(project_name)
  CreateProject.new.create_new_project(@dup_project_name)
end

Then(/^I can see Duplicate project Title on Project Detail Page$/) do
  ProjectDetailPage.new.project_title.verify_text(@dup_project_name)
end

Then(/^I can rename the project$/) do
  updated_project_name = 'Updated_project_name_' + random_string(8)
  ProjectDetailPage.new.rename_project updated_project_name
  ProjectDetailPage.new.project_title.verify_text updated_project_name
end


And(/^I can see 'OPEN PROJECT' link$/) do
  MyProjectList.new.open_project_link.verify_visible.verify_attribute("href", 'design-center/my-projects/')
end

And(/^I can see Duplicate Project Icon$/) do
  MyProjectList.new.duplicate_project_icon.verify_visible
end

And(/^I can see Delete Project Icon$/) do
  MyProjectList.new.project_list_delete_proj_btn.verify_visible
end

Then(/^I can see the Project Title$/) do
  ProjectDetailPage.new.project_title.verify_visible
end

And(/^I can see Date Created$/) do
  ProjectDetailPage.new.project_creation_date.verify_visible
end

And(/^I can see Date Modified$/) do
  ProjectDetailPage.new.project_modified_date.verify_visible
end

When(/^I click 'Edit' Icon$/) do
  ProjectDetailPage.new.click_edit_project_icon
end

Then(/^I can see 'Rename Project' Title$/) do
  ProjectDetailPage.new.rename_project_title
end


And(/^I can see icons '(.*)'$/) do|icon_lists|
  icon_list_arr = icon_lists.split(',')
  icon_list_arr.each do |icon_list|
    case icon_list
      when 'Edit'
        ProjectDetailPage.new.edit_project.verify_visible
      when 'Copy'
        ProjectDetailPage.copy_project.verify_visible
      when 'Delete'
        ProjectDetailPage.delete_project.verify_visible
    end
  end
end

Then(/^I can see Number of Contributors$/) do
  ProjectDetailPage.new.contributors_count.verify_visible
end

And(/^I can see list of users$/) do
  ProjectDetailPage.new.contributors_list.verify_count_greater_than 0
end


Then(/^I can see Help Text block$/) do
  ProjectDetailPage.new.project_help_textblock.verify_visible
end

And(/^I can see 'Create A Design' button$/) do
  ProjectDetailPage.new.create_a_design_btn.verify_visible
end

And(/^I can see 'View Reference Designs' button$/) do

  ProjectDetailPage.new.view_ref_design_btn.verify_visible
end

And(/^I can see '4' Help Item$/) do

  ProjectDetailPage.new.help_item_blocks.verify_count 4
end

And(/^I can see Help Item Icon$/) do
  PromoProject.new.promo_project_item_icon.verify_visible
end

And(/^I can see Help Item Title$/) do
  PromoProject.new.promo_project_item_title.verify_visible
end

And(/^I can see Help Item Description$/) do
  PromoProject.new.promo_project_item_desc.verify_visible
end