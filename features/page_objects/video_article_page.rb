class VideoArticlePage < NewsArticlePage


@page_url = "#{$base_url}/#{FigNewton.video_article_url}"

@article_video = WebElement.new(:id => 'vjs_video_3')

end