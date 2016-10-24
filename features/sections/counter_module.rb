class CounterModule < PageObject

  @ref_des_counter_slide = WebElement.new('.CounterCarousel-slide')
  @ref_des_counter_slide_icon = WebElement.new('.CounterCarousel-icon.is-purple')
  @prod_counter_slide_icon = WebElement.new('.CounterCarousel-icon.is-red')
  @manu_counter_slide_icon = WebElement.new('.CounterCarousel-icon.is-orange')
  @counter = WebElement.new('h3.CounterCarousel-figure-number')
  #Mobile and Tablet
  @mobile_counter_slide = WebElement.new('.CounterCarousel-slide.slick-slide.slick-current.slick-active')

  def get_number_of_counter_slide_displayed_on_mobile_devices
    @mobile_counter_slide.count
  end
end