
class ReferenceDesignDetailPage < PageObject

  @page_url = "#{$base_url}/reference-designs/${ref_des_url_param}/${ref_des_id}"

  @body_title = WebElement.new(:class => 'ReferenceDetail-header-title')
  @body_sub_title = WebElement.new(:class => 'ReferenceDetail-header-subTitle')
  @description_title = WebElement.new('Part-Specifications-heading:nth-child(0)')
  @key_features_title = WebElement.new(:class => 'Part-Specifications-heading:nth-child(1)')
  @buy_bt = WebElement.new(:class => 'Button--red')
  @key_features_list = WebElement.new('.Part-Specifications-list:nth-child(1)')
  @description = WebElement.new(:css => 'ul.Part-Specifications-list>li')
  @enlarge_image = WebElement.new(:css => 'span.ImageCarousel-enlarge-icon>span')

  #image component on reference design detail page
  @image_carousel_parent = WebElement.new(:class => 'ImageCarousel-slide slick-slide slick-current slick-active')
  @displayed_image = WebElement.new('.ImageCarousel-slide-img',@image_carousel_parent)
  @image_thumbnail_counter = WebElement.new(:class => 'ThumbnailCarousel-counter')
  @image_thumbnail_current_count = WebElement.new({:class => 'ThumbnailCarousel-counter-current'},@image_thumbnail_counter)
  @image_thumbnail_grid = WebElement.new({:class => 'Icon--grid'},@image_thumbnail_counter)
  @image_component = WebElement.new(:class => 'ImageSlider')

  #manufacturer component on reference design detail page
  @manufacturer_component_parent = WebElement.new(['.ReferenceDetail-buy','.DatasheetToolbar'])
  @manufacturer_component_title = WebElement.new({:class => 'ReferenceDetail-buy-manufacturer'},@manufacturer_component_parent)
  @manufacturer_component_logo = WebElement.new('.ReferenceDetail-buy-image',@manufacturer_component_parent)
  @manufacturer_detail_list = WebElement.new('.ReferenceDetail-buy-list-title',@manufacturer_component_parent)
  @manufacturer_buttons_parent = WebElement.new('.ReferenceDetail-buy-buttons',@manufacturer_component_parent)

  @manufacturer_buy_button = WebElement.new('.Button--red',@manufacturer_buttons_parent)
  @manufacturer_envision_button = WebElement.new('.Button--green',@manufacturer_buttons_parent)
  @manufacturer_download_link = WebElement.new('.Icon--download',@manufacturer_component_parent)
  @manufacturer_save_to_favourite_link = WebElement.new('.Icon--save')

  #@manufacturer_share_link){share_content(manufacturer_component_parent_element)}
  #element(:manufacture_environmental_icon = WebElement.new(:css => 'i[class="Icon--rohs"]')

  #Associted documents
  @assoc_doc_content_view = WebElement.new(:class => 'ReferenceDetail-associatedDocs')
  @assoc_doc_heading = WebElement.new(:class => 'AssociatedDocs-title')
  @assoc_doc_item = WebElement.new(:class => 'IconList-item')
  @first_assoc_doc_download_link = WebElement.new('.Icon--download',@assoc_doc_item)

  #Featured parts
  @featured_parts_parent = WebElement.new(:id => 'featuredProductSearchContainer')
  @featured_parts_heading = WebElement.new('.Part-Specifications-heading',@featured_parts_parent)
  @featured_parts_table = WebElement.new('.SearchResults-results',@featured_parts_parent)

  def get_size_of_associated_docs
    @assoc_doc_item.count
  end


  #mobile
  # @assoc_doc_tab_view_parent = WebElement.new(:class => 'TabbedContent-tabs')
  # @assoc_doc_tab){assoc_doc_tab_view_parent_element.link_elements(:class => 'TabbedContent-tab')}
  # @mobile_assoc_doc_active_tab){assoc_doc_tab_view_parent_element.link_element(:class => 'TabbedContent-tab is-active')}

  # End Products
  @end_products_parent = WebElement.new(:class => 'ReferenceDetail-endProducts')
  @end_products_heading = WebElement.new(:class => 'EndProducts-title')
  @end_products_item = WebElement.new('.BoxedList-item',@end_products_parent)

  def get_size_of_end_products
    @end_products_item.count
  end

  #Research & Events Can use the Masonry Module instead.
  # @reference_design_related_parent = WebElement.new(:class => 'ReferenceDesigns-section--related')
  # @related_research_and_event_heading){reference_design_related_parent_element.h2_element(:class => 'BlackHeader')}
  # @related_research_and_event_list){reference_design_related_parent_element.div_elements(:class => 'Masonry-item')}

  def click_image_thumbnail_grid
    @image_thumbnail_grid.click

  end

  def is_image_gallery_open
    @mage_component.attribute('class').include?('show-thumbnails')
  end


  def click_to_enlarge_image
    @enlarge_image.click
  end

  def click_save_to_project_image
    @manufacturer_save_to_favourite_link.verify_visible.click
    sleep(2)
  end

  # def get_href_attribute_for_active_tab
  #   mobile_assoc_doc_active_tab_element.attribute('href')
  # end

  # def click_asscoiated_doc_tab
  #   assoc_doc_tab_elements.first.click
  # end
  #
  # def click_end_products_tab
  #   assoc_doc_tab_elements[1].click
  # end

  class FeaturedPartsItem < PageObject

    @featured_parts_image = WebElement.new("cell")
    @featured_parts_name = WebElement.new(:class => 'SearchResults-column--name')
    @featured_parts_manufacturer = WebElement.new(:class => 'SearchResults-column--manufacturer')
    @featured_parts_type = WebElement.new(:class => 'SearchResults-column--type')
    @featured_parts_desc = WebElement.new(:class => 'SearchResults-column--description')
    @featured_parts_icon_parent = WebElement.new(:class => 'SearchResults-column--share RoundCtas')
    @featured_parts_btn_parent = WebElement.new(:class => 'SearchResults-column--cta' )
  end

end