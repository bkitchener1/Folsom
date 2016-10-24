class EngineerPage < PersonPage

  @details_header = WebElement.new(class: 'Person-header-sub')
  @availability_indicator = WebElement.new(class: 'Person-header--inline Person-engineer-online js-specificAgentChatBlock')


  def is_online?
    @availability_indicator.present?
  end

  def header_details_complete?
    @details_header_element.span.count == 3
  end

end