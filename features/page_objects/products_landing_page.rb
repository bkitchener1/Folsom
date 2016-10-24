
class ProductsLandingPage < PageObject

  @page_url = "#{$base_url}/products"

  @tabbed_content_parent = WebElement.new(:class => 'TabbedContent-tabs')
  @new_products_tab = WebElement.new({:link_text => 'NEW PRODUCTS'})
  @all_products_tab = WebElement.new(:link_text => 'ALL PRODUCTS')
  #featured manufacturer heading
  @manufacturer_parent = WebElement.new(:class => 'ProductLanding-manufacturers')
  @manufacturer_heading = WebElement.new({:class => 'BlackHeader--keyline-buttons'},@manufacturer_parent)

end