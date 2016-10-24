class NewsArticlePage < ArticlePage
  #include RelatedContentModule

  @page_url = "#{$base_url}/#{FigNewton.news_article_url}"

  @article_links = WebElement.new(class: 'InformationTile-psuedoLink')

end

