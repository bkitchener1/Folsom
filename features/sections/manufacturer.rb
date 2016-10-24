class Manufacturer < PageObject

  @manufacture_product_link = WebElement.new(:css => 'div.ManufacturersLogo--carousel a')
  @manufacture_product_image = WebElement.new(:class => 'ManufacturersLogo--carousel-image')


  def get_first_manufacture_product_link_url
    @manufacture_product_link.attribute('href')
  end

end