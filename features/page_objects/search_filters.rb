class FilterCheckBox < PageObject
  attr_accessor :value_text, :checkbox_filter

  @checkbox_label = WebElement.new("label")
  @checkbox_filter= WebElement.new("input")

  def get_checkbox_filter_id
    @checkbox_filter.attribute('id')
  end

  def is_checkbox_checked
    # @checkbox_filter.attribute_value('class').end_with? '--active'
    @checkbox_filter.verify_selected
  end

  def click_label
    #checkbox_label_element.click
    @checkbox_label.click
  end
end

class FilterRadio < FilterCheckBox
  attr_accessor :parent_elem, :radio_value_text

  # def initialize(parent_elem, radio_value)
  #   @parent_elem      = parent_elem
  #   @radio_value_text = radio_value
  # end

  # @radio_filter) { @parent_elem.radio_button_element(:value => @radio_value_text) }
  # @radio_label  { radio_filter_element.parent.label_element(:index => 0) }

  # def select_first_radio_filter()
  #   list_items_element.first.click
  # end

  def select_radio_filter_based_on_value
    @radio_label.click
  end
end

class FilterContainer < PageObject
  attr_accessor :parent_elem

  @container_link = WebElement.new(:class => 'FilterContainer-link')
  @see_more = WebElement.new(:class => 'FilterContainer-seeMore')
  @filter_list_items = WebElement.new("list")
  @nested_links = WebElement.new('.FilterContainer-filter--listLink')
  @input_filters = WebElement.new('.FilterContainer-filterInput')
  @radio_filters = WebElement.new('.FilterContainer-filterInput input[type=radio]')
  @labels = WebElement.new("label")
  @see_more_link = WebElement.new('.FilterContainer-seeMore')
  @filter_contents = WebElement.new(class: 'FilterContainer-filterScroll')
  @filter_checkboxes = FilterCheckBox.new("li.FilterContainer-filterInput")
  @filter_radios = FilterRadio.new(".FilterContainer-filterInput")

  @back_to_supercategory = FilterRadio.new(class: 'u-textArrow')

  def is_filter_group_expanded
    self.attribute('class').include? 'FilterContainer-filter--open'
  end

  def is_filter_group_radio_checkbox_type
    self.attribute('class').include? 'FilterContainer-filter--radio'
  end

  def verify_radio_filters_present
    @radio_filters.verify_present
  end

  def get_nested_links_text_within_group
    @nested_links.collect { |filter_link| filter_link.text }
  end

  def get_checked_radio_link_filter_within_group
    filter_elem = @radio_filters.select { |radio_link_elem| radio_link_elem.attribute('class').include? 'FilterContainer-filterRadioLink--checked' }.first.parent
    get_filter_data_name(filter_elem)
  end

  def get_radio_filters_data_name_within_container
    @input_filters.collect { |input_filter| input_filter.attribute('data-name') }.join(", ")
  end

  def get_all_labels_with_filter_container
    @labels.select { |label_elem| label_elem.displayed? }.collect { |label_elem| label_elem.text }
  end

  def does_filter_have_see_more_link
    @see_more.displayed?
  end

  def is_icon_visible(icon_type)
    WebElement.new(:class => "Icon--#{icon_type}").displayed?
  end
end


class SearchFilters < PageObject


  @filter_containers = FilterContainer.new('.FilterContainer-filter', @search_filter_bar)
  @filter_checkboxes = FilterCheckBox.new("li.FilterContainer-filterInput")
  @filter_radios = FilterRadio.new("li.FilterContainer-filterInput")
  @product_categories= WebElement.new("div[class=Categories-item-right]")
  @product_sub_categories_header= WebElement.new(".CategoryListings-items-item>h3>a")
  @manufacturer_filter= WebElement.new("label[for=Manufacturer_name0]")
  @tablet_filters= WebElement.new(".SearchControls--tabletFilter")
  @search_filter_bar = WebElement.new(:id => 'FilterContainer')
  @filters_btn = WebElement.new(:class => 'SearchControls--tabletFilter')
  @filter_links = WebElement.new('.SearchResults-filterContainer')
  @close_filters_btn = WebElement.new(:class => 'FilterContainer-close')
  @apply_filter_btn = WebElement.new(:class => 'FilterContainer-apply')
  @expand_all_filters_btn = WebElement.new(:class => 'FilterContainer-expandAll')
  @cancel_filter_btn = WebElement.new(:class => 'FilterContainer-cancel')
  @all_filter_containers = WebElement.new('.FilterContainer-filter',@search_filter_bar)
  @radio_filter_containers = FilterRadio.new('.FilterContainer-filter--radio',@search_filter_bar)
  @share_this_search_link = WebElement.new(:css => '.SearchControls-share a')
  @category_filters = WebElement.new(class: 'FilterContainer-filter--listLink')
  @visible_category = WebElement.new(class: 'visible')
  @subcategory_filters_list = WebElement.new(class: 'FilterContainer-nestedList')
  @first_subcategory_filter_link = WebElement.new("a",@subcategory_filters_list)
  @filter_backlinks = WebElement.new('.FilterContainer-filter--seeAllCategories')
  @filter_search_field = WebElement.new('.FilterContainer-filterSearchField')
  @left_slider_handle = WebElement.new(class: 'noUi-handle noUi-handle-lower')
  @filter_scroll_bar = WebElement.new(class: 'FilterContainer-filterScroll')
  @more_options_information_panel = WebElement.new(class: 'FilterContainer-additional-panel')
  @individual_filter_panel = WebElement.new(class: 'FilterContainer-filtersContainer')
  @filter_panel_scrollbar = WebElement.new(class: 'FilterContainer-filterScrollBar')
  @filter_slider = WebElement.new(class: 'noUi-connect')
  @filter_eurohs = WebElement.new(id: 'eurohs0')
  @filter_checkboxes = FilterCheckBox.new("li.FilterContainer-filterInput")
  @filter_radios = FilterRadio.new("li.FilterContainer-filterInput")
  @product_categories= WebElement.new("div[class=Categories-item-right]")
  @product_sub_categories_header= WebElement.new(".CategoryListings-items-item>h3>a")
  @tablet_filters= WebElement.new(".SearchControls--tabletFilter")
  @automatically_apply_filters = WebElement.new(class: 'FilterContainer-autoApply-Checkbox')
  @overlay = WebElement.new(".Overlay")
  @clear_all_filters_link = WebElement.new('.SearchControls-clearFilters')
  @second_cat= WebElement.new('.FilterContainer-filterScroll>ul>li:nth-child(2)>a')

  @switch_to_horizontal_filters_button = WebElement.new(class: 'SearchControls-filterOrientation')

  def verify_filter_group_displayed text
    @filter_container_filter.where(:text, text).first.verify_present
  end

  def switch_to_horizontal_filters
    @switch_to_horizontal_filters_button.click if @switch_to_horizontal_filters_button.displayed?
  end

# Generic methods that apply to the whole Search Filters module
  def are_search_filters_visible
    @search_filter_bar.displayed?
  end

  def number_of_category_filter_options
    @filter_links.count
  end

  def verify_datasheets_mode
    @search_filter_bar.verify_attribute('class', 'is-datasheet-mode')
  end

  def open_search_filters_on_mob
    @filters_btn.click
  end

  def set_minimum_scroll_filter_to(filter_minimum_value = 30)
    handle = WebElement.new('.noUi-origin.noUi-connect')[2]
    script = "return arguments[0].style = 'left: #{filter_minimum_value}%;'"
    $driver.execute_script(script, handle.element)
    handle.attribute('style')
  end

  def close_search_filters_on_mob
    @close_filters_btn.verify_visible.click
  end

  def cancel_search_filters_on_mob
    @cancel_filter_btn.verify_visible.click
  end

  def get_all_filter_containers_text
    @filter_containers.collect { |filter_container_elem| filter_container_elem.text }.join(", ")
  end

  def get_amount_of_filter_containers
    @filter_containers.count
  end

  def filter_by_link_no(index)
    # p filter_links_elements[index - 1].text
    @filter_links[index -1].verify_visible.click
  end

  def get_checkbox_filter(value_text)
    @filter_checkboxes.where(:text, value_text).first
  end

  def apply_search_filter
    # BKT-630 The Apply / Cancel Buttons are only visible for non-desktop
    if $size == "mobile" or $size == "phablet" or $size == "tablet"
      @apply_filter_btn.click
    end
    @overlay.verify_not_visible(200)
  end

  def get_filter_container_by_data_value(data_filtergroup_value)
    filter_elem = @filter_containers.select { |filter_container| filter_container.attribute('data-filtergroup') == data_filtergroup_value }.first
    filter_elem
  end

  def filter_container_displayed?(data_filtergroup_value)
    false if get_filter_container_by_data_value(data_filtergroup_value).nil?
  end

  def get_filter_container_by_display_text(filter_container_text)
    filter_elem = @all_filter_containers.select { |filter_container| filter_container.text.include? filter_container_text }.first
  end

  def get_filter_by_data_name(data_name)
    WebElement.new(:css => %!li[data-name="#{data_name}"]!)
  end

  def click_category(cat)
    @product_categories.select { |category| category.text.include? cat }.first.click
  end

  def click_sub_category_heading(sub_cat)
    @product_sub_categories_header.select { |sub_category| sub_category.text.include? sub_cat }.first.click
  end

  def verify_category_manufacturer_filter(cat,manu)
    if $size == "mobile"
      @tablet_filters.click
      @category_filters.verify_text(cat)
      @manufacturer_filter.verify_text(manu)
    elsif $size == "tablet"
      @tablet_filters.click
      @category_filters.verify_text(cat)
      @manufacturer_filter.verify_text(manu)
    elsif $size == "desktop"
      @category_filters.verify_text(cat)
      @manufacturer_filter.verify_text(manu)
    end
  end

  def verify_automatic_search_filters
    contents_before_filtering =   self.filter_containers[2].text
    self.manufacturer_filter.click
    contents_after_filtering = self.filter_containers[2]
    contents_after_filtering.verify_text_not(contents_before_filtering)
  end

end
