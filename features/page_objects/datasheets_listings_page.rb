
class DatasheetItem < PageObject

  attr_accessor :datasheet_id, :datasheet_for_products, :item_elem

  #Put PO's for search item elems here.
  # @datasheet_name) {@item_elem.element.@class => 'SearchResults-column--name')}
  @datasheet_name = WebElement.new("a")

  @manu_name = WebElement.new(:class => 'SearchResults-productManufacturer')
  @view_datasheet_btn = WebElement.new(:class => 'Button')
  @view_products_btn = WebElement.new(:class => 'SearchResults-viewProducts')
  @datasheets_for_related_parts = WebElement.new(".SearchResults-column li")
  @datasheet_download = WebElement.new(:class => 'js-download-button')

  def get_datasheet_id
    @datasheet_name.attribute("href").gsub("#{$base_url}/datasheets/", "")
  end

  def is_item_a_datasheet
    @item_elem.attribute('class').include? 'SearchResults-datasheetRow'
  end

  def verify_item_is_datasheet
    @item_elem.verify_attribute('class','SearchResults-datasheetRow')
  end

  def get_datasheets_for_related_parts
    @datasheets_for_related_parts.collect { |list_item_elem| list_item_elem.text }
  end

  def get_no_of_datasheets_for_related_parts
    @datasheets_for_related_parts.count
  end

  def open_datasheet_detail_page
    @view_datasheet_btn.click
    DatasheetsDetailPage.new
  end

  def click_on_manu_name
    @manu_name.click
    ManufacturersDetailPage.new
  end
end

class DatasheetsListingsPage < SearchResultsPage

  @page_url = "#{$base_url}/${search_path_with_param}"

  @view_datasheets_btns = WebElement.new(:css => 'tr.SearchResults-datasheetRow a.Button--bordered')
  @part_titles = WebElement.new(:class => 'SearchResults-productName')
  @datasheet_items = DatasheetItem.new(".SearchResults-datasheetRow")
  @related_parts = WebElement.new("tr[class*='SearchResults-resultRow'][style='display: table-row;'] .SearchResults-productName")

  # locator to verify datasheet search

  @search_results_count = WebElement.new(:class =>"SearchResultsCount")

# method to verify datasheet count
# verify search count is not zero

def verify_search_count_not_zero
  count = (@search_results_count.text).gsub("Datasheets for", "").gsub("products", "").to_i
  if count!=0
    $logger.info"count not zero"
    $logger.info count
  else
    raise Exception.exception "count is zero"
    $logger.error count
  end
end


  def first_datasheet_with_multiple_parts
    items = @datasheet_items
    items = @datasheet_items.select{ |x|
      x.datasheets_for_related_parts.count > 1
    }
    items.first


end
end
