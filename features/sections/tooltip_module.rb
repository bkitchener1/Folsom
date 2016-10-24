class TooltipModule < PageObject

  @tooltip_container = WebElement.new(:class => 'tooltipster-base')
  @close_tooltip = WebElement.new('.u-Tooltip-close',@tooltip_container)
  @pipeline_details = WebElement.new('.BuyingOption-pipeline-details')
  def is_tooltip_open
    @tooltip_container.present?
  end

  def close_tooltip
    @close_tooltip.click
  end

  def does_tooltip_have_pipeline_details
    @pipeline_details.present?
  end
end