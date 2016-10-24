class FilterableSection < PageObject
  @info_tiles = InformationTile.new(".InformationTile")
end

class ResearchEventsPage < PageObject

  @page_url = "#{$base_url}/research-and-events"

  @black_section_headers = WebElement.new('.BlackHeader')
  @section =  FilterableSection.new(".Masonry--filterable")
  @articles = FilterableSection.new(".Masonry--filterable:nth-child(2)")
  @events = FilterableSection.new(".Masonry--filterable:nth-child(4)")
  @videos = FilterableSection.new(".Masonry--filterable:nth-child(6)")

  def get_black_section_headers
    black_headers = @black_section_headers.collect { |h2| h2.text }.join(" ").to_s
    black_headers.gsub("SEE ALL\n", '') #Strip out the see all text
  end

  def get_size_of_section_headers
    @black_section_headers.count
  end

  def click_first_event
    @events.first.info_tiles.click
  end
end