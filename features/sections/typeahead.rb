class ProductCategoryItem < PageObject

  @header_text = WebElement.new("h3")
  @product_link = WebElement.new("a")
  @product_icon = WebElement.new('i')
  @parts_text = WebElement.new("p")

end

class TypeAhead < PageObject

  @typeahead_parent = WebElement.new(:class => 'Typeahead')
  @typeahead_categories = WebElement.new(:class => 'TypeaheadCategories')
  @typeahead_related_search = WebElement.new(:class => 'TypeaheadAutocomplete')
  @close_typeahead_btn = WebElement.new(:class => 'Header-search-closeTypeahead')
  @categories = ProductCategoryItem.new(:class => 'TypeaheadCategories-items')
  @total_parts = WebElement.new(:class => 'TypeaheadCategories-header')
  @auto_complete_results = WebElement.new({:class => 'TypeaheadAutocomplete-result'}, @typeahead_related_search)
  @typeahead_results = WebElement.new('.js-search-autocomplete.TypeaheadAutocomplete.is-visible')
  @cat_links = WebElement.new('.TypeaheadAutocomplete-resultsIn>ul a')

  def get_results_in_cats_hrefs
    @cat_links.collect { |cat_link_elem| cat_link_elem.attribute('href') }
  end


end