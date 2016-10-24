class HomePage < ArrowBase
  @page_url = $base_url
  @canonical_link = WebElement.new('link[rel="canonical"]')
  @promo_project_parent = WebElement.new('#designCenter-projects')
  @promo_project_items = WebElement.new('.PromoProject-item',@promo_project_parent)

  # add for COP-165
  @contact_support_link = WebElement.new('a[href="/en/support/contact-support/contact-arrow"]')
  @feed_back_button = WebElement.new(:css=>"a.Button.Button--bordered.js-feedback")

  @recently_viewed_datasheets = RecentlyViewedItem.new(".RecentlyViewed--datasheets")
  @recently_viewed_reference_designs = RecentlyViewedItem.new(".RecentlyViewed--designs")

  def check_divisions_pages
    divisions_pages_urls = ['electronic-components', 'oem-computing-solutions', 'arrow-value-recovery']
    divisions_pages_urls.each do |divisions_page|
      $driver.get("#{$base_url}/divisions/#{divisions_page}")
      HomePage.new.verify_page_integrity
    end
  end

  # adding method for COP-165
  def contact_support_page
    @contact_support_link.click
    @feed_back_button.click
  end

  # adding method for COP-165
  def feedback_button
    @feed_back_button.click
  end

  # adding method for COP-165
  def verify_feed_back_link(feed_back_url)
    @feed_back_button.verify_attribute('href',feed_back_url)
  end
end