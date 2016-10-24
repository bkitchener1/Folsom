class MyProjectsHowTo < PageObject
  @my_project_item_image_parent = WebElement.new(:class => 'MyProjectsListing-howTo-item-image')
  @my_project_item_image = WebElement.new(:class => 'Icon')
  @my_project_item_desc_parent = WebElement.new(:class => 'MyProjectsListing-howTo-item-description')
  @my_project_item_desc = WebElement.new("p")
end

class MyProjectList < PageObject
  @project_title = WebElement.new(:class => 'MyProjects-item-title')
  @project_modified_date = WebElement.new(:class => 'MyProjects-item-date')
  @open_project_link = WebElement.new(:class => 'MyProjects-item-link')
  @duplicate_project_icon = WebElement.new(:class => 'Icon--copy')
  @project_list_delete_proj_btn = WebElement.new(:class => 'Icon--delete')
end

class ProjectsListingPage < PageObject

  @page_url = "#{$base_url}/design-center/my-projects"

  @project_list_div = WebElement.new(class: 'MyProjects--moreAvailable')
  @my_projects_howTo_parent = WebElement.new(:class => 'MyProjectsListing-howTo-wrapper')
  @my_projects_howTo_title = WebElement.new("h2",@my_projects_howTo_parent)
  @my_projects_howTo_close_icon = WebElement.new('.Icon--cross',@my_projects_howTo_parent)
  @my_projects_howTo_items = WebElement.new('div.MyProjectsListing-howTo-item')

  @create_new_project_tile = WebElement.new(:class => 'MyProjects-item--create-border')

  @my_project_list = WebElement.new(:class => 'MyProjects-item--visible')


  @project_title = WebElement.new(:class => 'MyProjects-item-title')
  @sort_controls = WebElement.new('.SearchControls-select.js-sort')

  #Loggded in User with some projects
  @my_project_listing_parent = WebElement.new(:class => 'MyProjectsListing-intro')
  @my_project_listing_title = WebElement.new("h1",@my_project_listing_parent)
  @my_project_listing_sort = WebElement.new(:class => 'SearchControls-select')
  @project_listing_header_create_project_btn = WebElement.new('.js-createProject',@my_projects_howTo_parent)

  def get_list_of_all_my_project_sort_option
    @my_project_listing_sort_options
  end

  def open_a_project_from_project_list(project_name)
    WebElement.new(partial_link_text: project_name).verify_present.click
  end

  def verify_project(project_name)
    WebElement.new(partial_link_text: project_name).verify_present
  end

  def get_project_title_element(project_name)
    title_elem = nil
    @project_title.each do |elem|
      if elem.text.include?(project_name.upcase)
        title_elem = elem
      end
    end
    title_elem
  end

  def delete_all_project_from_project_list
    counter = @my_project_list.count
    while(counter > 1 and not counter.nil?)
      MyProjectList.new.project_list_delete_proj_btn.click
      DeleteProjectModule.new.delete_project
      counter = @my_project_list.count
    end
  end


  def click_create_new_project_tile
    @create_new_project_tile.click
    sleep(2)
  end

end