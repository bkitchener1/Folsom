Then(/^I can see that the engineer profile is correctly formed$/) do
  DesignCenterLandingPage.new.engineer_promos.first.verify_elements_displayed
end