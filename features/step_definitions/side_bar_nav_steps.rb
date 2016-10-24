Then(/^The selected Side Nav Item is "([^"]*)"$/) do |arg|
  SideNav.new.selected_side_nav_item.verify_text arg
end