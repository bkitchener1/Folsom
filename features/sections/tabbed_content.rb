class TabbedContent < PageObject

  @tabbed_content = WebElement.new(:class => 'TabbedContent-tabs')
  @tabbed_content_links = WebElement.new(:class => 'TabbedContent-tab')
  @mob_tabbed_content = WebElement.new(:class => 'TabbedContent-heading u-phablet-up-hide')

  # def tabbed_content_links
  #   @class => 'TabbedContent-tab')
  # end

  def tabbed_content_link(link_text)
    WebElement.new(:link_text => link_text)
  end

  def does_tabbed_content_link_exist(link_text)
    tabbed_content_link(link_text).verify_visible
  end

  def get_selected_tab
    WebElement.new("a",@tabbed_content).verify_attribute(:class,'is-selected')
  end

  def verify_tabbed_content_visible
    @tabbed_content.verify_visible
  end
end