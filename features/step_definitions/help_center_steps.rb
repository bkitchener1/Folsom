Given(/^I visit the Contact Us Page$/) do
  ContactUsPage.new.visit_default_page
end

Then(/^I can see "([^"]*)" Regions of Arrow Contacts$/) do |size|
  ContactUsPage.region_sections.verify_count size
end

Given(/^I visit the FAQ Page$/) do
 ContentPage.open_page(:content_pg_url => "#{FigNewton.faq_page}")
end

Then(/^I can see an Accordion of High Level FAQs$/) do
  Accordion.new.first_high_level_accordion.accordion_heading.verify_visible
end

When(/^I click on a High Level FAQ$/) do
  Accordion.new.first_high_level_accordion.accordion_heading.click
end

Then(/^I can see an Accordion of Low level FAQ's$/) do
  Accordion.new.first_low_level_accordion.accordion_sub_heading.verify_visible
end

When(/^I click on a Low level FAQ$/) do
  Accordion.new.first_low_level_accordion.accordion_sub_heading.click
end

Then(/^I can see and Answer to the FAQ$/) do
  Accordion.new.first_low_level_accordion.faq_answer.verify_visible
end

Then(/^I can see an Email Link$/) do
  ContactUsPage.new.contact_email_present
end

Then(/^I can see a Customer Support Button$/) do
  ContactUsPage.new.customer_sup_btn_present
end

And(/^I can see an Online Chat Button$/) do
  ContactUsPage.new.online_chat_btn_present
end

Then(/^I can see a Leave Feedback Button$/) do
  ContactUsPage.new.feedback_btn_present
end


Given(/^I visit the Contact Us Page for "([^"]*)"$/) do |country|
  if country == "Austrilia"
    cust_ip = "54.79.52.185"
  elsif country == "Canada"
    cust_ip = "204.187.14.73"
  end
  $driver.get "#{$base_url}/#{FigNewton.contact_us_page}/?custip=#{cust_ip}"

end

Then(/^I can see a Phone Link$/) do
  ContactUsPage.new.contact_phone_present
end

Then(/^The Contact Us Page Body Title shows "([^"]*)"$/) do |arg|
  ContactUsPage.new.contact_heading_verify_text(arg)
end

Then(/^I can see at least "([^"]*)" Region$/) do |min_size|
  @num_of_countries = ContactUsPage.new.get_num_of_countries
  expect(@num_of_countries).to be >= min_size
end


Then(/^The Country Item should have a Flag Icon$/) do
  ContactUsPage.new.country_flag_present(1)
end

And(/^The Country Item should have a Title$/) do
  ContactUsPage.new.country_name_present(1)
end

And(/^The Country Item should have a Phone Number$/) do
  ContactUsPage.new.country_phone_number_present(1)
end


Then(/^All FAQs have a Plus icon$/) do
  @faq_count = Accordion.new.faq_count
  @plus_count = AccordionBlock.new.plus_count
  expect(@faq_count).to eq (@plus_count)
end

Then(/^I expand all the FAQ levels$/) do
  AccordionBlock.new.expand_all_faqs
end

Then(/^I should see Minus icons for each$/) do
  @minus_count = AccordionBlock.new.minus_count
  expect(@faq_count).to eq (@minus_count)
end