class EmbeddedSearch < PageObject

  @embedded_search_div = WebElement.new(:class => 'Embedded-search')
  @embedded_search  = WebElement.new(:class => 'Embedded-search-input')
  # @embedded_search_btn = WebElement.new(:class => 'Embedded-search-submit')
  @embedded_search_btn = WebElement.new('.Icon--arrow-search',@embedded_search_div)
  @embedded_search_form = WebElement.new("form",@embedded_search_div)

  def get_embedded_search_form_action
    @embedded_search_form.attribute('action')
  end

  def submit_embedded_search(search_term)
    @embedded_search.send_keys search_term
    @embedded_search_btn.click
    # ProductListingsPage.new()
  end
end