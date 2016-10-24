Then(/^The Search Results Columns stick to the Header$/) do
  SearchResultsPage.search_container.verify_attribute('class','showStickySearch')
end

Then(/^The header is visible$/) do
  Header.header.verify_visible
end

Then(/^The Divisions Menu is NOT visible$/) do
  Header.divisions_menu.verify_not_visible
end

When(/^I click on the Arrow Divisions button$/) do
  Header.divisions_btn.click
end

Then(/^The Divisions Menu is displayed$/) do
  Header.divisions_menu.verify_visible
end

When(/^I close the Arrow Divisions Menu$/) do
  DivisionsMenu.close_divisions_menu.click
end

Then(/^I can see at least "([^"]*)" Arrow Divisions Link$/) do |arg|
  DivisionsMenu.divisions.verify_visible
end

And(/^Each Arrow Divisions Link has a Title and Description$/) do
  DivisionsMenu.divisions.each { |division|
    division.title.verify_visible
    division.description.verify_visible
  }
end

Then(/^The Header Menu changes to a minimised state$/) do
  Header.header.verify_visible
  Header.header_search.verify_not_visible
  Header.minimized_header.verify_visible
end

Then(/^The Header is NOT in a minimised state$/) do
  Header.header.verify_visible
  Header.search_mag_glass_icon.verify_visible
  Header.minimized_header.verify_not_visible
end

Then(/^I CANNOT see the MyArrow Link$/) do
  Header.my_arrow_link.verify_not_visible
end

When(/^I click on the Login or Sign Up Link$/) do
  Header.login_link.click
end

Then(/^I can see the MyArrow Link$/) do
  Header.my_arrow_link.verify_visible
end

Then(/^I can see the Login or Sign Up Link$/) do
  Header.login_link.verify_visible
end

Then(/^I can see that I am Logged In$/) do
  Header.login_link.verify_not_visible
  Header.my_account.verify_visible
end

When(/^I hover over the Nav item Products$/) do
  Header.new.products.hover
end

Then(/^I cannot see the MegaMenu$/) do
  Header.new.megamenu_container.verify_not_visible
end

When(/^I select a "([^"]*)" item$/) do |arg|
  if arg == "Products"
    Header.products.click
  elsif arg == "Datasheets"
    Header.datasheets.click
  elsif arg == "Research and Events"
    Header.research_and_events.click
  else
    raise "#{arg} not supported"
  end
end

Then(/^The "([^"]*)" Channel has a count of New Products$/) do |arg|
  Header.new_products.verify_text_not 0
end

Then(/^I will see the "(.*?)"$/) do |telephone|
  Header.phone.verify_text telephone
end

Then(/^I will see the telephone icon$/) do
  Header.phone_icon.verify_visible
end

And(/^I click on MyArrow in the Header$/) do
  Header.my_arrow_link.click
end

Then(/^I click Design Center from the MegaMenu$/) do
  Header.new.click_design_center
end

Then(/^I should see a Ad banner in the header on desktop only$/) do
  if $size == "desktop" || $size == "tablet"
    Header.ad_banner.verify_visible
  elsif $size == "mobile"
    Header.ad_banner.verify_not_visible
  end
end

Then(/^I should be directed to the components site and be shown as logged in$/) do
  @myarrow_loggedin= WebElement.new("#login_content>H5")
  @myarrow_loggedin.verify_text("Hello, automation")
end

Then(/^I can see Search Bar$/) do
  Header.header_search.verify_visible
end

And(/^I can see Default Text$/) do
  Header.search_default_text.verify_visible
end

And(/^I can see Search Magnifying Glass icon$/) do
  Header.search_mag_glass_icon.verify_visible
end

And(/^I can see Search Button$/) do
  Header.search_bar_search_button.verify_visible
end
And(/^I can see the Search text$/) do
  Header.search_text.verify_visible
end

Then(/^The Header Search input visibility is "([^"]*)"$/) do |visibility|
  element = Header.header_search_input
  if visibility
    element.verify_visible
  else
    element.verify_not_visible
  end
end

Then(/^The Divisions Button is NOT visible$/) do
  Header.divisions_btn.verify_not_visible
end

And(/^The Arrow Phone number is NOT visible$/) do
  Header.phone.verify_not_visible
end

And(/^The Live Support is NOT visible$/) do
  Header.live_chat.verify_not_visible
end

And(/^The Search input is NOT visible$/) do
  Header.header_search_input.verify_not_visible
end

Then(/^The new Arrow header should be displayed correctly/) do
  Header.new.verify_new_header
end

Then(/^The Arrow header should be displayed correctly$/) do
  Header.new.verify_header_arrow
end


Then(/^The Arrow header should be displayed correctly for a logged in user$/) do
  Header.new.verify_logged_in_arrow
end

When(/^I click the hamburger menu in the header$/) do
  Header.hamburger_menu_closed.click
end

Then(/^The hamburger menu should open and display properly$/) do
  Header.new.verify_hamburger_menu
end

And(/^click "([^"]*)" with the hamburger menu open$/) do |arg|
  Header.new.click_link_hamburger(arg)
end

Then(/^I should be on the "([^"]*)" page$/) do |page|
  if page == "Products"
    $driver.verify_url"#{$base_url}/products"
  elsif page == "Datasheets"
    $driver.verify_url"#{$base_url}/datasheets"
  elsif page == "Reference Designs"
    $driver.verify_url"#{$base_url}/reference-designs"
  elsif page == "Research and Events"
    $driver.verify_url"#{$base_url}/research-and-events"
  elsif page == "Design Center"
    $driver.verify_url"#{$base_url}/design-center"
  elsif page == "Login"
    $driver.verify_url"#{$base_url}/login?url="
  elsif page == "MyArrow"
    $driver.verify_url"#{$base_url}/arrow-services/myarrow"
  end
end

Then(/^I can see the correct languages listed in the hamburger drop down$/) do Header
  Header.new.verify_ham_language
end

Then(/^The currency dropdown should be displayed in the hamburger menu$/) do
  Header.new.verify_ham_currency_dropdown
end

When(/^I click the Arrow Logo in the new header$/) do
  Header.arrow_logo.click
end

Then(/^I should be taken back to the home page$/) do
  $driver.verify_url"#{$base_url}"
end

Then(/^I should see my user as logged in$/) do
  Header.new.verify_user_logged_in
end

Then(/^I click on the Login Link in the header$/) do
  Header.new.ham_login.click
end


And(/^I click on the Language in the new header$/) do
  Header.new.language.click
end

Then(/^Contact number should appear in the header correctly$/) do
  Header.new.phone_num.verify_text"1-855-326-4757"
end

Then(/^The live support option should appear in the header$/) do
  Header.new.live_support.verify_text"LIVE SUPPORT"
end


And(/^I click on the user menu$/) do
  Header.new.user_loggedin.click
end

Then(/^A drop down should appear with the proper links in it$/) do
  page= Header.new
  page.user_dropdown.verify_visible
  page.profile_settings.verify_visible
  page.password_change.verify_visible
  page.order_history.verify_visible
end

When(/^I click on the order history link$/) do
  Header.new.order_history.click
end

When(/^I click on change your password$/) do
  Header.new.password_change.click
end

When(/^I click on profile settings link$/) do
  Header.new.profile_settings.click
end

And(/^I can see an updated Arrow Divisions CTA$/) do
  Header.new.arrow_divisions_tab.verify_visible
end

When(/^I select the Arrow Divisions tab$/) do
  Header.new.arrow_divisions_tab.click
end

Then(/^I should see the Arrow Divisions menu$/) do
  Header.new.divisions_menu_expanded.verify_visible
end

When(/^I select the computing solutions category$/) do
  Header.new.computing_solutions.click
end


Then(/^I should be on the Computing Solutions division page$/) do
  $driver.verify_url"#{$base_url}/divisions/computing-solutions"
end

And(/^I select the Electronic Components category$/) do
  Header.new.electronic_components.click
end

Then(/^I should be on the Electronic Components division page$/) do
  $driver.verify_url"#{$base_url}/divisions/electronic-components"
end

And(/^I select the OEM Computing Solutions category$/) do
  Header.new.oem_computing.click
end

Then(/^I should be on the OEM Computing Solutions division page$/) do
  $driver.verify_url"#{$base_url}/divisions/oem-computing-solutions"
end

And(/^I select the Arrow Value Recovery category$/) do
  Header.new.arrow_value_recovery.click
end

Then(/^I should be on the Arrow Value Recovery division page$/) do
  $driver.verify_url"#{$base_url}/divisions/arrow-value-recovery"
end