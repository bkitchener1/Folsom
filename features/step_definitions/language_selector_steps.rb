When(/^I click on the Language in the Header$/) do
  LanguageSelector.language_selector.click
end

Then(/^The selected Language matches the URL parameter$/) do
  language = case $lang
               when 'en'
                 'English'
               when 'es'
                 'Espanol'
             end
  LanguageSelector.selected_language.verify_text language
end
When(/^The Language Selector drop-down is visible$/) do
  LanguageSelector.lan 'de-de'
end


When(/^I change the site language to German$/) do
  LanguageSelector.new.change_site_language_to 'de-de'
end

When(/^I change the site language to Chinese$/) do
  LanguageSelector.new.change_site_language_to 'zh-cn'
end


Then(/^I can locate the language tracking tag for English in the source$/) do
  HomePage.canonical_link.verify_attribute('href','/en')
end

Then(/^I can locate the language tracking tag for German in the source$/) do
  HomePage.canonical_link.verify_attribute('href','/de')
end

Then(/^I can locate the language tracking tag for Chinese in the source$/) do
  HomePage.canonical_link.verify_attribute('href','/zh')
end

Then(/^I can see the Arrow site with the language parameter of "([^"]*)"$/) do |lang|
  $driver.verify_url("#{lang}-#{lang}")
end

Then(/^The html contains a language attribute "([^"]*)"$/) do |lang|
  $driver.verify_html("#{lang.downcase}-#{lang.upcase}")
end

Then(/^I can see at least "([^"]*)" Languages to choose from$/) do |arg|
  LanguageSelector.new.language_list_items.verify_count_greater_than arg
end