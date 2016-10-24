class SideNav < PageObject
  #@side_nav_parent = WebElement.new(:class => 'ContentPage-sidebar')
  @side_nav_parent = WebElement.new(:class => 'js-SideNav')
  @side_nav_title = WebElement.new(:class => 'SideNav-title')
  @side_nav_items = WebElement.new(:class => 'SideNav-menu-item')
  @selected_side_nav_item = WebElement.new('.is-selected',@side_nav_parent)
  @dashboard_link = WebElement.new("a[href*=design-center]")
  @my_projects_link = WebElement.new("a[href*=my-projects]")
  @arrow_engineers_link = WebElement.new("a[href*='design-center/engineers']")
  @new_project_btn = WebElement.new(".is-expanded a")

  #mobile
  @side_nav_title = WebElement.new(:class => 'SideNav-title u-desktop-up-hide')

  def side_nav_link(link_text)
    WebElement.new({:link_text => link_text},@side_nav_parent)
  end

  def get_selected_side_nav_item_text
    @selected_side_nav_item.first.text
  end

  def get_side_nav_link(link_text)
    WebElement.new({:partial_link_text =>link_text},@side_nav_parent)
  end

  def get_side_nav_link_href(link_text)
    get_side_nav_link(link_text).attribute('href')
  end

  def click_side_nav_link(link_text)
    get_side_nav_link(link_text).verify_present.click
  end

  def click_side_nav_title_on_mobile_devices
    @side_nav_title.click
  end

  def open_my_projects
    click_side_nav_link 'My Projects'
  end
end