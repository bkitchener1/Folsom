Then(/^I can see some Jump Links$/) do
  JumpToLinks.new.jump_to_list_items.verify_visible
end


Then(/^The Element has a GA Tag$/) do

  expect(@current_page.does_element_have_google_ad_tag(@element)).to be_truthy, "The Element did not have a GA attribute, or it's value was not ''. "
end

Then(/^The Header Element has a GA Tag$/) do
  Header.header.verify_attribute('data-gtm-tag','')
end

Then(/^The Footer Element has a GA Tag$/) do
  Footer.footer.verify_attribute('data-gtm-tag','')
end

Then(/^The Page Source contains a Rich Relevance variable of "([^"]*)"$/) do |rr_page_type|
  $driver.verify_html "var R3_#{rr_page_type} = new r3_#{rr_page_type.downcase}();"
end

And(/^The Page Source contains the Search Term in the Rich Relevance section$/) do
  $driver.verify_html "R3_SEARCH.setTerms('#{@search_term}');"
end

And(/^The Page Source contains the common Rich Relevance Script$/) do
  common_script = %!var R3_COMMON = new r3_common();
        R3_COMMON.setApiKey('cba3598f6284d538');
        R3_COMMON.setBaseUrl(window.location.protocol + '#{FigNewton.rr_base_url}.richrelevance.com/rrserver/');
        R3_COMMON.setClickthruServer(window.location.protocol + "//" + window.location.host);!
  $driver.verify_html common_script
  $driver.verify_html "R3_COMMON.setSessionId"
  $driver.verify_html "R3_COMMON.setUserId"

end

Given(/^I execute the Step "([^"]*)"$/) do |step_name|
  step %!#{step_name}!
end


Then(/^I can see a Counter Slide Module$/) do
  CounterModule.new.ref_des_counter_slide.first
end

Then(/^I can see a Product Counter with valid number$/) do
  CounterModule.new.counter.verify_text_not(0,30,true)
  CounterModule.new.counter.verify_text_not("",30,true)
end

And(/^I can see a placeholder text in the text field$/) do
  TabbedContent.email_text_field.verify_attribute('placeholder', 'Enter your email')
end

Then(/^All the Tabbed Content Links are visible$/) do
  TabbedContent.new.tabbed_content_links.verify_count_greater_than 1
  TabbedContent.new.tabbed_content_links.each do |link|
    link.verify_visible
  end
end

Then(/^The html contains a Favicon link$/) do
  Favicon.favicon.verify_present
  Favicon.favicon.verify_attribute('href', "static/img/icons/favicon.ico?")
end

Then(/^The html contains a Favicon link for iOS$/) do
  Favicon.favicon_ios.verify_present
  Favicon.favicon_ios.verify_attribute('href', "static/img/icons/apple-touch-icon-57x57.png?")
end