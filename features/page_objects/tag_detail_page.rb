class TagDetailPage < PageObject
@page_url = $base_url + FigNewton.tag_details_url
@tag_detail_header = WebElement.new(:class => 'Tags-header')

end