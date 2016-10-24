class ErrorPage < PageObject

  @page_url = "#{$base_url}/error_page_dud_url"

  @error_page_body = WebElement.new(:class => 'Errors u-grid-6')
  @error_page_img = WebElement.new("img",@error_page_body)
  @error_page_title = WebElement.new(:class => 'Errors-title')
  @error_page_info = WebElement.new(:class => 'Errors-info')
  @error_page_useful = WebElement.new(:class => 'Errors-useful')

end