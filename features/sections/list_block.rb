
class ListBlockSection < PageObject
  @list_block_item = WebElement.new(:class => 'listBlock-item')
  @list_block_section_heading = WebElement.new(:class => 'listBlock-header-heading')
  @first_item_image = WebElement.new(:class => 'listBlock-item-image')
  @first_item_text = WebElement.new(:class => 'listBlock-item-text')

  def get_list_item_image_url()
    @first_item_image.attribute('style')
  end

end

class ListBlock < PageObject

  @list_block_parent = WebElement.new(:class => 'u-float-right-desktop')
  @hot_topic_heading = WebElement.new(:class => 'BlackHeader')
  @list_block = ListBlockSection.new(:class => 'listBlock')

end