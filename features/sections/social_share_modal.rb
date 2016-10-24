class SocialShareModal < PageObject
  @share_modal = WebElement.new(:class => 'Modal--share')
  @share_icons = WebElement.new('.Share-link', @share_modal)
  @pinterest = WebElement.new(:class => 'Icon--pinterest')
end