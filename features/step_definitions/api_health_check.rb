Then(/^I should see no errors on the Health Check page$/) do
  ApiHealthCheckPage.open_page.verify_healthy
end