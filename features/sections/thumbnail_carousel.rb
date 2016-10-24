class ThumbnailCarousel < PageObject

  @thumbnail_carousel_parent = WebElement.new(:class => 'ThumbnailCarousel-carousel')
  @thumbnail_carousel_slides = WebElement.new('.slick-active')
  @selected_thumbnail_carousel_slide = WebElement.new('.is-selected')

end