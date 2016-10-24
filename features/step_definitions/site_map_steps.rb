# adding the missing file

When(/^The(?:n)? (\w+) sitemap is provided$/) do |sitemap_type|
  AdminInstrumentsPage.open_page.login_as_admin
  SitemapAdminPage.open_page.update_sitemaps
  $driver.get(FigNewton.base_url + "/admininstruments/sitemapadmin/download?sitemap=#{sitemap_type}")
  $driver.verify_html '<sitemapindex'
end

When(/^A(?:n)? (\w+) sitemap is provided$/) do |sitemap_type|
  AdminInstrumentsPage.open_page.login_as_admin
  SitemapAdminPage.open_page.update_sitemaps
  url = FigNewton.base_url + "/sitemaps/#{sitemap_type}_sitemap.xml?custip=#{FigNewton.sitemap_bot_custom_ip}"
  $driver.get(url)
  $driver.verify_html 'xml version='
end

When(/^I can view the available sitemaps$/) do
  AdminInstrumentsPage.open_page.login_as_admin
  SitemapAdminPage.open_page.sitemap_list.verify_count_greater_than 0
end

When(/^I can update the sitemaps$/) do
  AdminInstrumentsPage.open_page.login_as_admin
  SitemapAdminPage.open_page.update_sitemaps
  SitemapAdminPage.new.starting_sitemap_update_notification.verify_visible
end

When(/^I can rebuild the sitemaps$/) do
  AdminInstrumentsPage.open_page.login_as_admin
  SitemapAdminPage.open_page.rebuild_sitemaps
  SitemapAdminPage.new.starting_sitemap_update_notification.verify_visible
end

When(/^I can restart the sitemap builder$/) do
  AdminInstrumentsPage.open_page.login_as_admin
  SitemapAdminPage.open_page.restart_sitemap_build_button.verify_visible
end

Then(/^The sitemap index should be present$/) do
  pending
end


# added for COP-160
Then(/^the Sitemap page should load without exceptions$/) do
  SitemapPage.new.verify_sitemap_pages

end

Then(/^the Sitemap video page should load without exceptions$/) do
  SitemapPage.new.verify_sitemap_video_page
end

Given(/^I am on the master sitemap$/) do
  pending
end

Given(/^I visit the Sitemap Page$/) do
  ContentPage.open_page(:content_pg_url => 'sitemap')
end


# add for product site map

Then(/^the Sitemap product page should load without exceptions$/) do
  SitemapPage.new.verify_sitemap_product_page
end

Then(/^the Sitemap search page should load with links to pages$/) do
  SitemapPage.new.verify_cairo_sitemap_search
end