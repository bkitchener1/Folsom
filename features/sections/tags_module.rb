class TagItem < PageObject

  @tag_link = WebElement.new(:class => 'Tags-item-link')
  @tag_text = WebElement.new(:class => 'Tags-item-text')

  def click_tag
    @tag_link.click
  end

  def assert_tag_href
    @tag_link.verify_attribute('href',"#{$base_url}/tags/")
  end

  def is_tag_visible
    self.displayed?
  end

end

class ContentTags < PageObject

  @tags_section = WebElement.new(:class => 'Article-tags')
  @tags_section_h3 = WebElement.new('.Article-tags-header')

  @tags = TagItem.new('.Tags-item a')

end