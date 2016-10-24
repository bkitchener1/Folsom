Given(/^I visit the Articles Landing Page$/) do
  NewsLandingPage.open_page
end

And(/^I view a news item$/) do
  NewsArticlePage.article_links[-1].click
end

Then(/^I will see the Title$/) do
  ArticlePage.new.title.verify_visible
end


And(/^I will see the Full date$/) do
  ArticlePage.new.date.verify_visible
end

And(/^I will see the Tags$/) do
  ArticlePage.arrow_page_tags.verify_visible
end

And(/^I will see the Share icon$/) do
  ArticlePage.share_btn.verify_visible
end

And(/^I will see the Add to content icon$/) do
  ArticlePage.add_content_btn.verify_visible
end

Then(/^I will see the main image$/) do
  ArticlePage.main_img.verify_visible
end

And(/^the image's caption if one exists$/) do
  ArticlePage.main_img_caption.verify_visible
end


Then(/^I will see the article's authors names$/) do
  ArticlePage.author_names.verify_visible
end

And(/^I will see the article's authors picture$/) do
  ArticlePage.author_imgs.verify_visible
end

And(/^I will see the article's authors company name$/) do
  ArticlePage.author_company_names.verify_visible
end

And(/^I will see the article's authors bio$/) do
  ArticlePage.author_bios.verify_visible
end

And(/^I will see the default written by text$/) do
  ArticlePage.written_by.verify_text 'Published By'
end

And(/^I visit the Video Article Page$/) do
  VideoArticlePage.open_page
end

And(/^I visit the Videos Landing Page$/) do
  VideoLandingPage.open_page
end

Given(/^I visit a News Article on the Arrow site$/) do
  NewsArticlePage.open_page
end

And(/^I click the Author name$/) do
  ArticlePage.new.click_author_name
end

And(/^I click 'Read More' Link for the Author Description$/) do
  ArticlePage.new.click_read_more_for_author_description
end

Then(/^I can view the Video module within the body content$/) do
  VideoArticlePage.new.article_video.verify_visible
end
