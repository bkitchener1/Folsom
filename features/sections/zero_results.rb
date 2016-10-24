class ZeroResults < PageObject
  @zero_results_div = WebElement.new(:class => 'SearchNoResults')
  @no_results_header = WebElement.new(:class => 'SearchNoResults-header')
  @no_results_sub_header = WebElement.new(:class => 'SearchNoResults-subheader')
  @zrp_buttons = WebElement.new('.Button--bordered',@zero_results_div)
end