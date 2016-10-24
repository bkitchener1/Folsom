class Megamenu < PageObject
  @section_headers = WebElement.new("h2")
  @section_header_links = WebElement.new('h2.u-header2Small>a')
  @sections = WebElement.new('div.u-row>div')
  @recently_viewed = WebElement.new(".NewList-Title")

  def recently_viewed_section
    return @sections.last
  end

  def is_visible?
    @megamenu_panel.displayed?
  end

  # returns a string of the headers that dislay at the top of the menu sections
  def get_section_headers
    @section_headers.collect { |header| header.text }.join(', ')
  end

  # returns a collectino of href's for any seciton headers that are links

  def get_section_div_using_index(index)
    @sections_elements[index - 1]
  end


  def get_links_of_section(section_elem)
    section_elem.link_elements(:css => 'li.NewList-Item>a')
  end

  def get_category_links_of_section(section_elem)
    section_elem.link_elements(:css => 'li.CategoriesList-item>a')
  end
end