# update for locator at 2000

class Paging < PageObject
  @load_more = WebElement.new(:class => 'SearchResults-loadMore')
  #@refine_search_after_400 = WebElement.new(:class => 'SearchResults-loadMore--refine')
  @back_to_top = WebElement.new(:class => 'BackToTop--search')
  @refine_search_message = WebElement.new(:class => 'SearchResults-pagination--refine')
end