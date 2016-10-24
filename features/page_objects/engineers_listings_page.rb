class EngineersListingPage < PageObject

  @page_url = "#{$base_url}/design-center/engineers"

  @load_more_engineers = WebElement.new(:class => 'Button--loadMore')
  @email_engineer_buttons = WebElement.new(class: 'js-message-engineer')

  @email_modal_container = WebElement.new(class: 'Modal-designCenter--engineerMessage')

  @first_listed_engineer_profile_link = WebElement.new(class: 'Button--inverted-colors')
  @hero_header = WebElement.new(id: 'designCenter-listingHeaderBlock')
  @hero_header_title = WebElement.new({class: 'EngineerList-title'},@hero_header)
  @hero_header_description = WebElement.new("p",@hero_header)
  @hero_header_cta_container = WebElement.new({class: 'EngineerList-ctas'},@hero_header)
  @availability_indicator = WebElement.new(class: 'AvailablityBubble--offline')
  @hero_header_cta_container = WebElement.new(class: 'EngineerList-cta')
  @message_engineer_btn = WebElement.new(".js-message-engineer")

  @person_squares = PersonSquare.new(".PersonSquare")

  def get_first_engineer
    @person_squares.first
  end

  def open_engineers_profile
    @person_square_content_panels.first.hover
    @first_listed_engineer_profile_link.click
  end

  def no_of_engineers
    @person_squares.count
  end

  def email_engineer
    @email_engineer_buttons.click
  end

  def email_engineer_modal_displayed?
    @email_modal_container.displayed?
  end

  def verify_header_hero_is_displayed
    @hero_header.verify_present
    @hero_header_title.verify_present
    @hero_header_description.verify_present
  end

  def no_of_options_displayed
    @hero_header_cta_container.count
  end

  def number_of_engineers_offline
    @availability_indicator.count/2
  end

  def all_engineers_displayed?
    $logger.info "OFFLINE: #{self.number_of_engineers_offline}"
    $logger.info "TOTAL: #{self.no_of_engineers}"
    self.number_of_engineers_offline > 0 &&
         self.no_of_engineers > self.number_of_engineers_offline
  end

end