Then(/^The Embedded Search Module has a form action of "([^"]*)"$/) do |form_action_url|
  EmbeddedSearch.new.embedded_search_form.verify_attribute('action', "#{$base_url}#{form_action_url}")
end


When(/^I Search the Arrow site for "([^"]*)" using the Embedded Search module$/) do |arg|
  EmbeddedSearch.new.submit_embedded_search arg
end