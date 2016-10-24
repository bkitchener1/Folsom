Given(/^I visit the Design Centre Landing Page$/) do
  DesignCenterLandingPage.open_page
end

Then(/^The Register Link is correct$/) do
  $driver.verify_url"#{$base_url}/register"
end

When(/^I click 'New Project' button from Project Module$/) do
  DesignCenterLandingPage.new.click_new_project_from_side_nav
end

Then(/^I can see promo section with '(.*)' Promo Items$/) do |num_of_proj_item|
  designpage = DesignCenterLandingPage.new
  designpage.promo_project_items.verify_count(num_of_proj_item)
   @first_promo_project_item = PromoProject.new()
end


And(/^I can see the Promo Item Icon$/) do
  @first_promo_project_item.promo_project_item_icon.verify_visible
end

And(/^I can see the Promo Item Title$/) do
  @first_promo_project_item.promo_project_item_title.verify_visible
end

And(/^I can see the Promo Item Description$/) do
  @first_promo_project_item.promo_project_item_desc.verify_visible
end

And(/^I can see the Button 'Create a New Project'$/) do
  DesignCenterLandingPage.new.create_new_project_btn.verify_visible
end

And(/^I click Design Center menu drop down$/) do
  SideNav.new.click_side_nav_title_on_mobile_devices
end

# Commenting the duplicate step as cucumber is unable to find - COP-141
#When(/^I click 'New Project' button from Side Nav$/) do
  #DesignCenterLandingPage.new.click_new_project_from_side_nav
#end

Then(/^I can see Create Project popup$/) do
  CreateProject.new.create_project_form.verify_visible
end

Then(/^I can see two engineer promos$/) do
  DesignCenterLandingPage.engineer_promos.verify_count(2)
end

#cucumber not finding the step as the code is commented, commenting the whole - COP-141
#Then(/^The Register Link is correct$/) do
  #expect(get_link_href(on(DesignCenterLandingPage).login_modal_register_btn_element)).to eq "#{$base_url}/register"
#end


Then(/^I can see '(.*)' Arrow Promoted Tools$/) do |tool_count|
  DesignCenterLandingPage.new.design_centre_tools.verify_count(5)
end

And(/^I can see Tool name$/) do
  DesignCenterLandingPage.new.design_centre_tools.first.design_center_tool_title.verify_visible
end

And(/^I can see Tool Image$/) do
  DesignCenterLandingPage.new.design_centre_tools.first.design_center_tool_icon.verify_visible
end

And(/^I can see 'FIND OUT MORE' link$/) do
  DesignCenterTool.new.find_out_more_link.verify_visible
end

When(/^I click 'FIND OUT MORE' link$/) do
  DesignCenterTool.new.find_out_more_link.click
end

Then(/^I can see 'CLOSE' link$/) do
  DesignCenterTool.new.design_center_tool_close.verify_visible
end

And(/^I can see Tools Description$/) do
  page = DesignCenterLandingPage.new
  page.design_center_description.verify_present
  @design_center_tool_desc = page.design_center_description
end

And(/^I can see Cross Icon in Tools Description Section$/) do
  DesignCenterToolDescription.new.tool_desc_close_icon.verify_visible
end

And(/^I can see the Tools Description of first Tool$/) do
  DesignCenterLandingPage.new.design_centre_tools.first.verify_attribute("class","slick-active")
  DesignCenterLandingPage.new.tool_descriptions.first.tool_desc_info.verify_visible
  @design_center_tool_desc = DesignCenterLandingPage.new.tool_descriptions.first
end

And(/^I CANNOT see 'FIND OUT MORE' link for first Tool$/) do
  DesignCenterLandingPage.new.design_centre_tools.first.find_out_more_link.verify_not_visible
end

When(/^I click 'CLOSE' Link$/) do
  DesignCenterTool.new.design_center_tool_close.click
end

Then(/^I CANNOT see Tools Description$/) do
  DesignCenterToolDescription.new.tool_desc_info.verify_not_visible
end

When(/^I click Cross Icon from Tools Description Section$/) do
  DesignCenterToolDescription.new.click_design_centre_tool_desc_cross_icon
end


When(/^I create a New Project '(.*)'$/) do |project_name|
  @project_name = CreateProject.new.generate_random_project_name(project_name)
  CreateProject.new.create_new_project(@project_name)
  $driver.verify_title @project_name
end

Then(/^I am taken to Project detail page$/) do
  $driver.verify_url("design-center/my-projects/#{@project_name.downcase.gsub("_","")}/")
end

And(/^I delete the project$/) do
  ProjectDetailPage.new.delete_project_from_project_detail_page
  ProjectDetailPage.new.delete_project.click
end


And(/^I click "(.*)" from Side nav$/) do |link_text|
  SideNav.new.click_side_nav_link link_text
end

When(/^I click 'New Project' button from Side Nav$/) do
  DesignCenterLandingPage.new.click_new_project_from_side_nav
end

Then(/^I can see the Side Bar Navigation$/) do
  SideNav.side_nav_parent.verify_visible
end

And(/^The Side Bar has a "([^"]*)" link with href "([^"]*)"$/) do |link_text, link_href|
  SideNav.new.get_side_nav_link(link_text).verify_attribute("href","#{$base_url}#{link_href}")
end

And(/^The Side Bar has 'New Project' button$/) do
  SideNav.new.new_project_btn.verify_visible
end

And(/^The Side Bar has a Dashboard link$/) do
  SideNav.new.dashboard_link.verify_visible
end

And(/^The Side Bar has a My Projects link$/) do
  SideNav.new.my_projects_link.verify_visible
end

And(/^The Side Bar has a Arrow Engineers link$/) do
  SideNav.new.arrow_engineers_link.verify_visible
end

And(/^I clear all the existing project$/) do
  DesignCenterLandingPage.open_page
  DesignCenterLandingPage.open_my_projects
  ProjectsListingPage.delete_all_project_from_project_list
end

Then(/^I can see the lists of Latest Project$/) do
  DesignCenterLandingPage.latest_project_list.verify_count_greater_than 1
end

And(/^I click the bottom Create New Project button while not logged in$/) do
  DesignCenterLandingPage.new.click_new_project_from_project_module
end

Then(/^I click on the Login or Sign Up Link in the modal$/) do
  DesignCenterLandingPage.new.click_bottom_login
end

Then(/^I am redirected to the Design Center and I am logged in$/) do
  $driver.verify_url "#{$base_url}/design-center"
end

And(/^I delete all projects$/) do
  SideNav.new.open_my_projects
  ProjectsListingPage.new.delete_all_project_from_project_list
end

And(/^I click the register button$/) do
  CreateProject.login_modal_register_btn.click
end

When(/^I click 'New Project' button from Promo Module$/) do
  CreateProject.promo_create_proj_btn.click
end