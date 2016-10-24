And(/^The Mega Menu for "([^"]*)" has the Section Headers "([^"]*)"$/) do |channel_url, section_headers|
  Header.new.trigger_pullout_menu_for(channel_url)

  section_headers.split(", ").each{|header|
    Header.new.megamenu_headers.where(:displayed, true).where(:text, header).verify_count_greater_than 0
  }
end

Then(/^The Mega Menu for "([^"]*)" has the link "([^"]*)"$/) do |channel_url, link|
  Header.new.trigger_pullout_menu_for(channel_url)
  Header.new.verify_menu_has_link(link)
end

When(/^I hover over the Nav Item "([^"]*)"$/) do |channel_name|
  Header.new.hover_over_channel(channel_name)
end

Then(/^I can see the Recently Viewed Datasheet Item in the Mega Menu$/) do
  Megamenu.new.recently_viewed.verify_visible
end

Then(/^Each Link in Columnn "([^"]*)" of the MegaMenu is SEO Friendly$/) do |column_no|
  section_elem = @mega_menu.get_section_div_using_index(2)
  cat_links    = @mega_menu.get_category_links_of_section(section_elem)

  cat_links.each { |cat_link|
    url_param = convert_to_sitecore_url_format(cat_link.text)
    expect(@browser.li(class: /Megamenu-list-item is-red/).html).to match "/products/#{url_param}" }
end

