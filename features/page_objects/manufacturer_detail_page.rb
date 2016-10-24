class ManufacturersDetailPage < PageObject
  @page_url = "#{$base_url}/products/manufacturers/${manu_detail_pg_url}"

  #ResearchAndEvents
  @research_and_event_parent = WebElement.new(:id => 'GoToReasearchAndEvents')
  @research_and_events_heading = WebElement.new({:class => 'BlackHeader'},@research_and_event_parent)
  @load_more_btn = WebElement.new('.Button--loadMore')
end