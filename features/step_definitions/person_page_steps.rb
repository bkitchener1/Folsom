Then(/^I can see the (?:Author|Engineer|Sales Person)'s Name as the Title$/) do
  PersonPage.person_name.verify_visible
end

Then(/^I can see the (?:Author|Engineer|Sales Person)'s Personal Details$/) do
  PersonPage.personal_details.verify_visible
end

Then(/^I can see the (?:Author|Engineer|Sales Person)'s (?:Certificates|Skills)$/) do
  PersonPage.boxed_list.verify_count_greater_than 1
end

And(/^I can see the Author's Tags of Expertise$/) do
  EngineerPromo.expertise_tags.verify_visible
end

And(/^I can see the (?:Author|Engineer|Sales Person)'s Profile Picture$/) do
  PersonPage.person_profile_img.verify_visible
end

Then(/^I am taken to Author Info page$/) do
  $driver.verify_url 'research-and-events/authors'
end

And(/^I can see the (?:Author|Engineer)'s Job Title$/) do
  PersonPage.person_job_details.verify_present
end

