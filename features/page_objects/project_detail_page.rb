class ProjectDetailPage < PageObject
  @project_header = WebElement.new(:id => 'designCenter-listingHeaderBlock')
  @delete_project= WebElement.new('.Icon--delete.tooltipstered')
  @edit_project = WebElement.new('.Icon.Icon--edit')
  @copy_project = WebElement.new('.Icon--copy.tooltipstered')
  @project_title = WebElement.new(:id => 'ProjectTitleContent')
  @project_creation_date = WebElement.new(:class => 'DesignCenter-projectHeadingContainer-created')
  @project_modified_date = WebElement.new(:class => 'DesignCenter-projectHeadingContainer-modified')
  @project_detail_summary_parent = WebElement.new(:class => 'DesignCenter-projectDetailsPillSummaryBlock')
  @create_design_btn = WebElement.new({:class => 'Button--green'},@project_detail_summary_parent)
  @modal_btn_parent = WebElement.new(:class => 'Modal-buttons Modal-buttons--two')
  @modal_create_btn = WebElement.new({:class => 'Modal-button-register'},@modal_btn_parent)
  @open_in_envision_btn = WebElement.new({:link_text => 'Open in envision'},@project_detail_summary_parent)
  @breadcrumb_bar = WebElement.new(class: 'Content')

  @reference_designs = WebElement.new('.SearchResults-resultRow')
  @datasheets = WebElement.new("")
  #rename_project_popup
  @rename_project_title = WebElement.new(:class => 'Modal-header')
  @rename_textbox = WebElement.new(:class => 'ChangeNameInput')
  @update_proj_name_btn = WebElement.new('.Button--green.Modal-button-register.remodal-confirm')

  #help Item for project with no content
  @project_help_parent = WebElement.new(:id => 'designCenter-textCtaBlock')
  @project_help_textblock = WebElement.new({:class => 'DesignCenter-textCtaBlock-textBlock'},@project_help_parent)
  @project_help_button_parent = WebElement.new({:class => 'DesignCenter-textCtaBlock-ctaBlock'},@project_help_parent)
  @create_a_design_btn = WebElement.new("a[href*='envision']",@project_help_parent)
  @view_ref_design_btn = WebElement.new("a[href*='reference-designs']",@project_help_parent)

  @help_item_blocks_parent = WebElement.new('.PromoProject.PromoProject--four')
  @help_item_blocks = PromoProject.new({:class => 'PromoProject-item'},@help_item_blocks_parent)

  #Content Sections
  @project_content_parent = WebElement.new(:id => 'designCenter-listing')
  @ref_design_content_heading = WebElement.new(:id => 'referenceDesignSection')
  @datasheet_content_heading = WebElement.new(:id => 'dataheetSection')
  @product_content_heading = WebElement.new(:id => 'productSection')
  @events_content_heading = WebElement.new(:id => 'contentSection')
  @ref_design_content_parent = WebElement.new({:id => 'referenceSearchDesignCenterContainer'},@project_content_parent)
  @datasheet_content_parent = WebElement.new({:class => 'ProductResults DataResults'},@project_content_parent)
  @product_content_parent = WebElement.new({:id => 'productSearchDesignCenterContainer'},@project_content_parent)
  @research_and_events_listing = WebElement.new({:class => 'SearchResults ContentResults'},@project_content_parent)
  @reference_design_icon = WebElement.new({class: 'Icon--reference-design'},@project_content_parent)

  #Delete Content Modal
  @delete_content_modal_parent = WebElement.new(:class => 'ConfirmView')
  @delete_project_content_btn = WebElement.new({:class =>'Button Button--green'},@delete_content_modal_parent)

  #contributers
  @contributors_parent = WebElement.new(:class => 'DesignCenter-profileBlock--contributors')
  @contributors_count = WebElement.new({:class => 'DesignCenter-profileBlock-contributors'},@contributors_parent)
  @contributors_list = WebElement.new({:class => 'DesignCenter-userTable'},@contributors_parent)

  def confirm_project_content_deletion
    @delete_project_content_btn.verify_present.click
    sleep(5)
  end

  def click_create_design_button
    @create_design_btn.verify_visible.click
    @modal_create_btn.verify_visible.click
  end

  def rename_project new_name
    click_edit_project_icon
    update_project_name new_name
  end

  def click_edit_project_icon
    @edit_project.click
  end

  def update_project_name(updated_name)
    @rename_textbox.send_keys updated_name
    @update_proj_name_btn.click
  end

  def delete_project_from_project_detail_page
   # delete_project_content_btn_element.when_present.click
    @delete_project.verify_present.click
  end

  def verify_project_is_displayed(project_name)
    @project_header.verify_text(project_name)
  end


  class ProjectContent < PageObject
    @project_content_lists = WebElement.new(:class => 'SearchResults-results')
    @delete_project_content = WebElement.new(:class => 'Icon--delete')

    def get_the_project_content_column_heading_text
      @project_content_lists[0].text
    end

    def delete_project_content
      @delete_project_content.click
    end

  end
end