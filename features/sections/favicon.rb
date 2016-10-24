class Favicon < PageObject
  @favicon = WebElement.new('link[rel="shortcut icon"]')
  @favicon_ios = WebElement.new('link[rel="apple-touch-icon"]')
end