class ContentPage < PageObject

  @page_url = "#{$base_url}/${content_pg_url}"

  #Generic page locators/functions
  @page_title = WebElement.new(:class => 'ContentPage-title')
  @main_image_div = Div.new(:class => 'Image--main-wrapper')
  @main_img = Image.new("img",@main_image_div)


  ##########################################
  # Board of dirs Locators:
  @board_of_dirs_tab = Div.new(:css => 'div.TabbedContent-tabs>a')
  @exec_leadership_tab = Div.new(:css => 'div.TabbedContent-tabs>a:nth-child(1)')
  @board_of_dirs_content = WebElement.new(:id => 'tabBoard')
  @exec_leadership_content = WebElement.new(:id => 'tabExecutive')

  def is_board_of_dirs_tab_active
    does_element_contain_is_active(board_of_dirs_tab_element)
  end

  def is_board_of_dirs_content_visible
    @board_of_dirs_content.displayed?
  end

  def is_exec_leadership_tab_active
    does_element_contain_is_active(exec_leadership_tab_element)
  end

  def is_exec_leadership_content_visible
    @exec_leadership_content.displayed?
  end
##########################################
  # Sitemap Locators:
  @sitemap_page_section = WebElement.new(:class => 'Sitemap')
  @sitemap_page_title = WebElement.new(".Sitemap h1")
  @h2_links = WebElement.new('section.Sitemap h2 a')
  @h3_links = WebElement.new('section.Sitemap h3 a')
  @first_sub_category = WebElement.new(:class => 'Sitemap-List')
  @first_sub_category_links = WebElement.new("a",@first_sub_category)

  def get_no_of_h2_links
    @h2_links.count
  end

  def get_no_of_h3_links
    @h3_links.count
  end

  def get_no_of_links_in_first_sub_cat
    @first_sub_category_links.count
  end
  ##########################################

end