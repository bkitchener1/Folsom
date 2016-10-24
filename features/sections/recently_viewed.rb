
class RecentlyViewedItem < PageObject
  @recently_viewed_title = WebElement.new('header.RecentlyViewed-header')
  @recently_viewed_items_heading = WebElement.new('h4')

  @recently_viewed_items = WebElement.new(:class => 'IconList-item')

  @recently_viewed_embedded_search = WebElement.new(:class => 'Embedded-search-search')
  @embedded_search = WebElement.new(:class => 'Embedded-search-input')
  @embedded_search_btn = WebElement.new(:class => 'Icon--arrow-search')
  @embedded_search_form= WebElement.new('form')

  def submit_embedded_search(search_term)
    @embedded_search.send_keys search_term
    @embedded_search_btn.click
  end

end

class RecentlyViewed < PageObject
  @recently_viewed = WebElement.new(:class => 'RecentlyViewed')
  @reference_design = RecentlyViewedItem.new('.RecentlyViewed--designs')
  @datasheets = RecentlyViewedItem.new('.RecentlyViewed--datasheets')

end