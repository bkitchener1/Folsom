class DesignCenterTool < PageObject
  @design_center_tool_icon = WebElement.new(:class => 'Icon')
  @design_center_tool_title = WebElement.new(:class => 'DesignCenter-title')
  @find_out_more_link = WebElement.new(:class => 'DesignCenter-type-cta')
  @design_center_tool_close = WebElement.new(:class => 'DesignCenter-type-ctaClose')

  def click_find_out_more
    @find_out_more_link.click
  end

  def design_center_tool_close_link
    @design_center_tool_close.click
  end

end

class DesignCenterToolDescription < PageObject
  @tool_desc_image = WebElement.new(:class => 'ToolPanel-image')
  @tool_desc_close_icon = WebElement.new(:class => 'ToolPanel-close')
  @tool_desc_info = WebElement.new(:class => 'ToolDescription-info')
  @tool_desc_links_parent = WebElement.new(:class => 'ToolDescription-ctas')

  def click_design_centre_tool_desc_cross_icon
    @tool_desc_close_icon.click
  end
end

class DesignCenterLandingPage < PageObject

  @page_url = "#{$base_url}/design-center"

  @design_centre_parent = WebElement.new(:id => 'designCenter-tools')
  @design_centre_tools = DesignCenterTool.new('.ExpandingCarousel-slide',@design_centre_parent)
  @tool_descriptions = DesignCenterToolDescription.new(".ExpandingCarousel-panel")

  @engineer_promo_container = WebElement.new('.EngineerPromo-engineers')

  @design_center_description = DesignCenterToolDescription.new('.ToolDescription-info')

  #promo project
  @promo_project_parent = WebElement.new('.DesignCenter-section')
  @promo_project_items = WebElement.new('.PromoProject-item')
  @create_new_project_btn = WebElement.new('.js-createProject')
  @create_new_project_bottom_btn = WebElement.new('#designCenter-my-projects>button')
  @login_from_create_new_project = WebElement.new('.Modal-button-login')

  #Side Nav button
  @side_nav_create_project_btn = WebElement.new('.js-createProject',@side_button_parent)

  #logged in users
  @latest_project_parent = WebElement.new(:id => 'designCenter-latest-projects')
  @latest_project_list = WebElement.new(".MyProjects-item",@latest_project_parent)

  @engineer_promos = EngineerPromo.new('.PersonSquare')

  @close_links = WebElement.new(".DesignCenter-type-ctaClose")
  def close_link_displayed?
    @close_links.each do |link|
      return true if link.displayed?
    end
    nil
  end


  def design_center_tool_image_displayed?
    @design_center_tool_icon.verify_present
    @design_center_tool_icon.displayed?
  end

  def is_new_project_button_on_side_bar_visible
    get_side_nav_link('My Projects').parent.button.displayed?
  end

  def click_new_project_from_side_nav
    @side_nav_create_project_btn.verify_visible.click
  end

  def click_new_project_from_project_module
    @create_new_project_bottom_btn.verify_visible.click
  end

  def click_bottom_login
    @login_from_create_new_project.verify_visible.click
  end


end