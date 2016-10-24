class SecondaryNav < PageObject

  @secondary_nav = WebElement.new(:class => 'SecondaryNav')
  @discover = WebElement.new(:class => 'SecondaryNav-discover')
  @secondary_menu = WebElement.new(:class => 'SecondaryNav-menu')
  @dropdown_icon = WebElement.new(".Icon--dropdown")
  @secondary_nav_links = WebElement.new(:class => 'SecondaryNav-menu-item-link')


end