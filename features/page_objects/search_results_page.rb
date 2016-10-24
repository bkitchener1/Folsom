class SearchResultsPage < PageObject

  @results = WebElement.new(:id => 'searchListView')
  @results_rows = WebElement.new('.SearchResults-resultRow')
  @results_name_cells = WebElement.new(class: 'SearchResults-column--name')
  @results_rows = WebElement.new(".SearchResults-resultRow")
  @loading_spinner = WebElement.new(:class => 'loadingSpinner')

  @sticky_column_header = WebElement.new(:class => 'SearchResults-results')
  @search_container = WebElement.new(:class => 'SearchResults')
  @search_results_count = WebElement.new('.SearchResultsCount')
  @search_overlay = WebElement.new(:class => 'Overlay--searchLoading')
  @sort_drop_down = WebElement.new(:class => 'SearchControls-select')
  @datasheet_toggle = WebElement.new('.Datasheet-toggle-wrapper>a')
  @current_page_num = WebElement.new('.SearchResults-pagination--current')
  @page_forward = WebElement.new('.Icon--link-arrow')
  @page_back = WebElement.new('.Icon--link-back-arrow')

  # add locator for selecting count from drop dow for paging
  @per_page = WebElement.new(:class=>'SearchControls-select')

  ZERO_BASED_OFFSET ||= -1
  EVEN_NUMBERED_ROW ||= 2 + ZERO_BASED_OFFSET
  ODD_NUMBERED_ROW ||= 3 + ZERO_BASED_OFFSET

  # Returns a list of Sort Options' text.
  def get_sort_options_text
    @sort_drop_down.as_select.options.flat_map { |option| option.text }
  end

  def odd_numbered_search_result_row
    @results_name_cells[ODD_NUMBERED_ROW]
  end

  def even_numbered_search_result_row
    @results_name_cells[EVEN_NUMBERED_ROW]
  end

  def get_search_container_class
    @search_container.attribute('class')
  end

  def is_sticky_header_visible?
    @sticky_column_header.displayed?
  end

  def get_search_count_amount
    @search_results_count.text.delete("^0-9").to_i
  end

  # verify search count is not zero

  def verify_search_count_not_zero
   count = (@search_results_count.text).to_i
    if count!=0
      $logger.info"count not zero"
      $logger.info count
    else
      raise Exception.exception "count is zero"
      $logger.error count
    end
  end

  def click_search_result(text)
    WebElement.new(:partial_link_text=>text).click
  end

  # GENERIC
  def size_of_search_items
    #Includes header row, so subtract 1
    @results.count
  end

  # The Loading Spinner disappears once the Page load has completed (with API/AJAX requests complete)
  def wait_until_loading_spinner_finishes(timeout = 30)
    @loading_spinner.verify_not_visible(timeout)
  end

  # Using this causes issues with the Listing item classes.
  def first_result_item
    @results[1]
  end

  def last_result_item
    @results[size_of_search_items]
  end

  def get_default_column_header_text
    # columns = get_all_visible_columns_header_elems.reject { |column|
    #   #Filter out Feature columns
    #   column.attribute_value('class').include? 'SearchResults-heading-feature'
    # }
    # get_column_elem_text(columns)
  end

  def get_featured_column_header_elems
    get_all_visible_columns_header_elems.select { |column|
      #Filter out non-Feature/default columns
      column.attribute_value('class').include? 'SearchResults-heading-feature'
    }
  end

  def get_featured_column_header_text
    get_column_elem_text(get_featured_column_header_elems)
  end

  def get_all_visible_columns_header_elems
    WebElement.new('th.SearchResults-heading')
  end

  def get_column_elem_text(columns)
    # Extract the child link's text, and join into one string.
    columns.collect { |column| column.text }.join(" ")
  end

  def parse_result_item_for_search_keyword(search_keyword)
    for i in 1..(size_of_search_items)
      $logger.info "Checking row : #{i}"
      @results.verify_text(search_keyword)
    end

  end

  def click_on_search_column(column_data_sort_by)
    # Note there can be multiple matching columns because of Sticky header.
    WebElement.new("th[data-sort-by='#{column_data_sort_by}']").last.click
  end

  def wait_for_search_overlay_to_finish
    @search_overlay.verify_not_visible
  end

  def verify_current_page(num)
    @current_page_num.verify_text"#{num}"
  end
end

