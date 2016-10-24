Then (/^I '?(.\w+)'? the Feature Flag (?: )?'(.*)'$/) do |flag_state, flag_name,|
  AdminInstrumentsPage.open_page.login_as_admin
  FeatureFlagPage.open_page.change_flag(flag_name, flag_state)
  CacheControlPage.open_page.clear_cache
end

Then (/^I '?(.\w+)'? the Feature Flag (?: )?'(.*)' as user one$/) do |flag_state, flag_name,|
  AdminInstrumentsPage.open_page.login_as_user1
  FeatureFlagPage.open_page.change_flag(flag_name, flag_state)
  CacheControlPage.open_page.clear_cache
end

Then (/^I '?(.\w+)'? the Feature Flag (?: )?'(.*)' as user two$/) do |flag_state, flag_name,|
  AdminInstrumentsPage.open_page.login_as_user2
  FeatureFlagPage.open_page.change_flag(flag_name, flag_state)
  CacheControlPage.open_page.clear_cache
end

Then (/^I '?(.\w+)'? the Feature Flag (?: )?'(.*)' as user three$/) do |flag_state, flag_name,|
  AdminInstrumentsPage.open_page.login_as_user3
  FeatureFlagPage.open_page.change_flag(flag_name, flag_state)
  CacheControlPage.open_page.clear_cache
end

Then (/^I '?(.\w+)'? the Feature Flag (?: )?'(.*)' as user four$/) do |flag_state, flag_name,|
  AdminInstrumentsPage.open_page.login_as_user4
  FeatureFlagPage.open_page.change_flag(flag_name, flag_state)
  CacheControlPage.open_page.clear_cache
end