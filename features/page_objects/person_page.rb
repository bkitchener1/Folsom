class PersonPage < PageObject

  @person_info_parent = WebElement.new(:class => 'Person')
  @person_name = WebElement.new(:class => 'Person-header--h1')
  @person_job_details = WebElement.new('.Person-position')
  @area_of_expertise_parent = WebElement.new(:class => 'Person-tags')
  @person_profile_img = WebElement.new(:class => 'Person-picture')

  @personal_details = WebElement.new('#about')
  @boxed_list = WebElement.new(:class => 'BoxedList-item')

  @persons_skills = WebElement.new(:class => 'BoxedList-item-wrapper')

  def get_visible_personal_details
    @personal_details.select { |detail| (detail.displayed?) }
  end


  #for Tablet and Mobile. This is pre-refactoring. Have saved it in case tests need more depth.
  @person_job_details_parent = WebElement.new(:class => 'u-desktop-up-hide Person-titles')
  @person_position = WebElement.new(".Person-position",@person_job_details_parent)
  @person_company = WebElement.new(".Person-company",@person_info_parent)

  @person_detail_parent = WebElement.new(".Person-details",@person_info_parent)
  @person_contact_icon = WebElement.new(".Icon--phone",@person_info_parent)
  @person_contact_detail = WebElement.new('.IconList-item-text',@person_contact_icon)
  @person_available_time_icon = WebElement.new('.Icon--component-clock-and-timing',@person_detail_parent)
  @person_available_time_detail = WebElement.new('.IconList-item-text',@person_available_time_icon)


end