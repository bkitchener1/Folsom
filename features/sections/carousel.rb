class Carousel < PageObject

  @hero_carousel = WebElement.new(:class => 'HeroCarousel')
  @carousel_slide = WebElement.new(:class => 'HeroCarousel-slide')
  @carousel_slide_as_link = WebElement.new(:class => 'HeroCarousel-link')
  @carousel_slide_button = WebElement.new(:class => 'HeroCarousel-button')

  def is_carousel_visible?
    @hero_carousel.displayed?
  end

  def carousel_slide_href
    @carousel_slide_as_link.attribute("href")
  end

  def carousel_slide_button_link
    @carousel_slide_button.attribute("href")
  end

end
