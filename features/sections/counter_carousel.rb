class CounterCarousel < PageObject
  @counter_slide_icon = WebElement.new(:class => 'CounterCarousel-icon')
  @counter_slide_count = WebElement.new(:class => 'CounterCarousel-figure-number')
  @counter_slide_summary = WebElement.new(:class => 'CounterCarousel-paragraph')
end