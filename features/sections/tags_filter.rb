class TagsFilter < PageObject
  @page_filters = WebElement.new(:class => 'TagFilter-filter')
  @active_filter = WebElement.new('TagFilter-filter.is-active')
  @filter_tags = WebElement.new('.TagFilter-tags .BoxedList-item')
  @clear_filter_tags = WebElement.new(:class => 'TagFilter-clear-text')
  @active_filter_tags = WebElement.new('.Tags-item-link.js-rippleEffect.is-active')
  #
  # def is_first_filter_active
  #   does_element_contain_is_active(page_filters_elements.first)
  # end
  #
  # def is_tag_active(index)
  #   does_element_contain_is_active(filter_tags_elements[index + 1])
  # end
  #
  # def is_clear_tag_visible
  #   clear_filter_tags_element.displayed?
  # end
  #
  # def does_first_tag_contain_clear
  #   filter_tags_elements.first.attribute('class').include?('--clear')
  # end
  #
  # def get_all_visible_filter_tags
  #   filter_tags_elements.select { |filter_elem| filter_elem.displayed? }
  # end
end