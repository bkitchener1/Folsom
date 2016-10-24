class Analytics < PageObject
  @google_site_element = WebElement.new('meta[name="google-site-verification"]')
  @robots_meta_tag = WebElement.new('meta[name="robots"]')
  @canonical_link = WebElement.new('link[rel="canonical"]')
end