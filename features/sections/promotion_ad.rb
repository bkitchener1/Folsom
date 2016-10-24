class PromotionAd < PageObject

  @promo_parent = WebElement.new(:class => 'Hero-side')
  @promo_module = WebElement.new(:class => 'PromotionAd')
  @promo_header = WebElement.new(:class => 'PromotionAd-heading')
  @promo_text = WebElement.new(:class => 'PromotionAd-paragraph')
  @promo_btn = WebElement.new(:class => 'Button')
  @promo_module = WebElement.new(:class => 'PromotionAd')

end