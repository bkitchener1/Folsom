
class ResearchEventsItem < PageObject
  # include ShareModule, AddContentModule
  attr_accessor :item_title

  @item_title = WebElement.new(:class => 'SearchResults-column--description-heading')
  @item_title_link = WebElement.new(:css => 'h5.SearchResults-column--description-heading>a')
  @description = WebElement.new(:class => 'SearchResults-column--description-paragraph')
  @item_date = WebElement.new(:class => 'Article-date')
  @item_share_btn = WebElement.new('.Icon--share')
  @item_add_content_btn = WebElement.new('.Icon--save')
  @item_image = WebElement.new(:class => 'SearchResults-column SearchResults-column--image')

  def is_event?
    @item_title_link.attribute("href").include? '/events/'
  end

end

# Also known as Content Search
class ResearchEventsListingsPage < SearchResultsPage

  @page_url = "#{$base_url}/research-and-events/search?${search_param}"
  @content_search_titles = WebElement.new(:class => 'SearchResults-column--description-heading')

end