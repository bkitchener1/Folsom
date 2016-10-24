class Masonry < PageObject

  @masonry_sections = WebElement.new(:class => 'Masonry')

  @filterable_sections = WebElement.new(".Masonry--filterable")

  @empty_masonry_section = WebElement.new(".is-empty.Masonry")

  #for empty masonry
  @empty_masonry_message = WebElement.new(:class => 'Masonry-emptyMessage')

  @load_more_btn = WebElement.new(:class => 'Button--loadMore')

  @masonry_items = WebElement.new(:class => 'Masonry-item')
  @info_tiles = InformationTile.new(:class=> 'InformationTile')
  @one_by_one = WebElement.new('.Masonry-grid-1x.Masonry-grid-x1')

  @two_by_two = WebElement.new('.Masonry-grid-x2.Masonry-grid-2x')

  @two_by_one = WebElement.new('.Masonry-grid-x1.Masonry-grid-2x')

  # def load_more(parent_elem = filterable_sections_elements.first)
  #   parent_elem.button_element
  # end
  #
  # def load_all_items(parent_elem = filterable_sections_elements.first)
  #   if (does_element_contain_is_hidden(load_more(parent_elem)))
  #     pending("The Load More Button is hidden. This Page does not have enought Content")
  #   else
  #     load_more(parent_elem).click
  #   end
  # end

  def no_of_filterable_sections
    @filterable_sections.count
  end

  def filterable_section_data_url
    @filterable_sections.collect { |section| section.div_element(:class => 'Masonry-grid').attribute('data-url') }
  end
  #
  # # def masonry_items(parent_elem = filterable_sections_elements.first)
  # def masonry_items(parent_elem = page_body_element)
  #   parent_elem.div_elements(:class => 'Masonry-item')
  # end
  #
  # def masonry_items_with_content_tags(parent_elem = filterable_sections_elements.first)
  #   masonry_items(parent_elem).select { |masonry_item| does_masonry_item_have_content_tag(masonry_item) }
  # end
  #
  # def does_masonry_item_have_content_tag(masonry_item)
  #   !arrow_tags(masonry_item).empty?
  # end
  #
  def no_of_masonry_items(parent_elem = first_masonry_section_elem)
    masonry_items(parent_elem).count
  end

  #
  # def get_prod_image_element(parent_element)
  #   parent_element.image_element(:class => 'InformationTile-details-productImage')
  # end
  #


end