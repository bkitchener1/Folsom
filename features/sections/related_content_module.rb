class RelatedContentItem < PageObject
  @title = WebElement.new('.CarouselModule-slide-heading')
  @play_btn = WebElement.new(".CarouselModule-slide-image")
  @timestamp = WebElement.new(".CarouselModule-slide-creation")

end

class RelatedContentModule < PageObject
  @related_vid_section = WebElement.new(:class => 'Article-related')
  @title = WebElement.new(".Article-related>h3")
  @related_articles = RelatedContentItem.new(:class => 'CarouselModule-slide')

  @related_vid_next = WebElement.new(:class => 'CarouselModule-next')
  @related_vid_prev = WebElement.new(:class => 'CarouselModule-prev')

end