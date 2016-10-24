
class ResultItem < PageObject

  @result_count_text = WebElement.new(:class => 'ManufacturersTabs-results-item-num')

  # Ref. Design page has Design filter all/interactive. Locators below are to deal with the 2 types of filters.
  @all_design_link = WebElement.new(:class => 'ManufacturersTabs-results-item-link--all')
  @interactive_design_link = WebElement.new(:class => 'ManufacturersTabs-results-item-link--interactive')

  @all_design_count = WebElement.new('.ManufacturersTabs-results-item-num',@all_design_link)
  @interactive_design_count = WebElement.new('.ManufacturersTabs-results-item-num', @all_design_count)
  @result_name = WebElement.new(:class => 'ManufacturersTabs-results-item-text')
  @new_item = WebElement.new(:class => 'ManufacturersTabs-results-item-new')
  def hover_over_item
    self.hover
  end

  def is_item_new
    @new_item.exists?
  end

  def result_count(count_span = result_count_text.text)
    count_span.gsub(/[^a-z]/i, '').to_i
  end
end

class ManufacturersTabs  < PageObject

  @browse_manu_section = WebElement.new(:id => 'ManufacturersTabs')
  @browse_title = WebElement.new(:class => 'Content')
  @manu_nav = WebElement.new("ul",@browse_manu_section)
  @selected_tab = WebElement.new(:class => 'ManufacturersTabs-tab-link--is-selected')

  @active_section = WebElement.new(:class => 'ManufacturersTabs-results-section--is-active')
  @results_heading = WebElement.new("div.ManufacturersTabs-results-heading", @active_section)

  # The results can be be either as an image with a drawer (div), or plain text (link)
  @active_results_items_as_images = WebElement.new("div.ManufacturersTabs-results-item",@active_section)

  @active_results_items_as_text = WebElement.new("a.ManufacturersTabs-results-item",@active_section)

  @results_items = ResultItem.new("a.ManufacturersTabs-results-item")
  def first_manu_result
    @results_items.first
  end


  def module_class_name
    @browse_manu_section.attribute('class')
  end

  def is_browse_section_displayed
    @browse_manu_section.displayed?
  end

  def get_manu_tabs_link(data_target_name)
    WebElement.new(:css => "a[data-target=\"#{data_target_name}\"]")
  end

end