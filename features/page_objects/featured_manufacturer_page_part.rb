class FeaturedManufacturerPagePart < PageObject

  @manufacturer_module = WebElement.new({class: 'ProductLanding-manufacturers'})
  @manufacturer_image = WebElement.new({class: 'ManufacturersLogo--carousel-image'},@manufacturer_module)
  @manufacturer_link = WebElement.new({class: 'ImageAlign-container'} , @manufacturer_module)
  @link_to_first_manufacturer = WebElement.new(class: 'ImageAlign-container')

  def manufacturer_link_valid?
    @manufacturer_link.first.attribute('href').match /products\/manufacturers/
  end

end