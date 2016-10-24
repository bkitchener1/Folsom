class PromoProject < PageObject
  @promo_project_item_icon = WebElement.new(:class => 'Icon')
  @promo_project_item_title = WebElement.new(:class => 'PromoProject-item-title')
  @promo_project_item_desc = WebElement.new(:class => 'PromoProject-item-description')
end