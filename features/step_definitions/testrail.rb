

Given(/^I get the testrail project "([^"]*)"$/) do |arg|
  TestRailIntegrator.new(arg).create_suites_for_folders
end