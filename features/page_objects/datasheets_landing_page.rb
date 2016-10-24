class DatasheetsLandingPage < SearchResultsPage
  attr_accessor :latest_datasheet_heading, :datasheet_promo_btn, :datasheet_promo_header, :datasheet_promo_text
  @page_url = "#{$base_url}/datasheets"

  @latest_datasheet_heading = WebElement.new(:class => 'Part-Specifications-heading')

  @datasheet_promo_header = WebElement.new(class: 'HeroCarousel-header')
  @datasheet_promo_text = WebElement.new(class: 'HeroCarousel-body')
  @datasheet_promo_btn = WebElement.new('.HeroCarousel-button.Button.Button--red')

  def search_for_datasheet(query)
    $driver.get "#{$base_url}/products/search?q=#{query}&filters=&datasheets=true"
  end

end