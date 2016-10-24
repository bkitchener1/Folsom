class RelatedReferenceDesign < PageObject
  @container = WebElement.new(".ReferenceDesigns-section--related>div")
  @title = WebElement.new(".BlackHeader",@container)
  @tiles = InformationTile.new(".InformationTile--colored",@container)
end