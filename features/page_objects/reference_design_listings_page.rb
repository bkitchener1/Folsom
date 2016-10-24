
class ReferenceDesignItem < PageObject
  @design_name = WebElement.new(:css => 'h5.SearchResults-column--description-heading>a')
  @ref_design_desc = WebElement.new(:class => 'SearchResults-column--description-paragraph')
  @man_name = WebElement.new('td.SearchResults-column--manufacturerName>a')
  @ref_des_image = WebElement.new(:class => 'SearchResults-image')
  @for_application  = WebElement.new('td.SearchResults-column--application')
  @for_end_products= WebElement.new('td.SearchResults-column--endProducts')
  @view_btn = WebElement.new(:class => 'Button')
  @envision_btn = WebElement.new(:class => 'Button',:index => 1)
  @save_ref_des_btn = WebElement.new(:class=>"Icon--save")


  def open_ref_design_detail_page
    @design_name.click
  end

  def click_on_image
    @ref_des_image.click
  end

  def click_on_released_by_manu_name
    @man_name.click
  end

  def get_description_as_url
    convert_to_sitecore_url_format(@ref_design_desc.text)
  end
end

class ReferenceDesignListingsPage < SearchResultsPage

  @page_url = "#{$base_url}/reference-designs/search?${search_param}"

  @first_ref_design_title = WebElement.new(:class => 'SearchResults-column--description-heading')

  @reference_designs = ReferenceDesignItem.new('.SearchResults-resultRow')

end