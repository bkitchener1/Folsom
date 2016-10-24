class CartFooter < PageObject
  @copyright = WebElement.new({:css=>"span[translate*=copyrightMessage]"})
  @privacy = WebElement.new({:css=>"a[href*=privacy-policy]"})
  @terms = WebElement.new({:link_text=>"Terms of Use"})
  @cookie_policy = WebElement.new({:link_text=>"Cookie Policy"})
  @categories = WebElement.new({:link_text=>"Categories"})
  @sitemap = WebElement.new({:link_text=>"Sitemap"})

  def verify_visible
    @copyright.verify_visible
    @privacy.verify_visible
    @terms.verify_visible
    @cookie_policy.verify_visible
    @categories.verify_visible
    @sitemap.verify_visible
  end

  def verify_not_visible
    @copyright.verify_not_visible
    @privacy.verify_not_visible
    @terms.verify_not_visible
    @cookie_policy.verify_not_visible
    @categories.verify_not_visible
    @sitemap.verify_not_visible
  end
end