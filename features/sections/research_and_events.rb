class ResearchAndEvents < PageObject
  @container = WebElement.new(["#GoToReasearchAndEvents","#main-content>.Content"])
  @title = WebElement.new(".BlackHeader",@container)
  @tiles = InformationTile.new(".InformationTile",@container)

  @news_tiles = InformationTile.new("div[class*='InformationTile--article']", @container)
  @video_tiles = InformationTile.new("div[class*='InformationTile--video']", @container)
  @event_tiles = InformationTile.new("div[class*='InformationTile--event']", @container)
end