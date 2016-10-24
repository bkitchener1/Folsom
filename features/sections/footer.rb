class Footer < PageObject

  @footer = WebElement.new(:class => 'Footer')
  @footer_read_more_link = WebElement.new({:class => 'Footer-about-readMore'},@footer)
  @footer_divisions = WebElement.new(:class => 'Footer-divisions')
  @footer_divisions_logo = WebElement.new({:class => 'Footer-divisions-logo-big'},@footer_divisions)
  @footer_divisions_links = WebElement.new("a",@footer_divisions)
  @footer_secondary = WebElement.new(:class => 'Footer-secondary')
  @follow_us = WebElement.new(:css => 'section.Footer-social')
  @twitter= WebElement.new(".Icon--twitter")
  @youtube= WebElement.new(".Icon--youtube")
  @facebook= WebElement.new(".Icon--facebook")
  @linkedin= WebElement.new(".Icon--linkedin")
  @google= WebElement.new(".Icon--google-plus")


  def is_footer_displayed
    @footer.displayed?
  end

  def is_arrow_img_displayed
    @footer_divisions_logo.displayed?

  end

  def is_divisions_links_in_footer_empty
    @footer_divisions_links.empty?
  end

  def get_footer_secondary_text
    @footer_secondary.text
  end

  def get_footer_links(parent_elem)
    parent_elem.find_element(:class , 'Link--onDark')
  end

  def is_follow_us_displayed
    @follow_us.displayed?
  end

  #Will return the href as a string.
  #n.b. CSS locator will search within the FooterModule-social section tag in html.
  # i.e. parent-child r'ship with module and it's contents.
  def verify_href(share_name, href)
    # self.follow_us_element.element.@css => "a.Icon--#{share_name}").href
    WebElement.new("a.Icon--#{share_name}").verify_attribute('href', href)
  end

  def verify_social
    @follow_us.verify_visible
    @twitter.verify_visible
    @youtube.verify_visible
    @facebook.verify_visible
    @linkedin.verify_visible
    @google.verify_visible
  end

end