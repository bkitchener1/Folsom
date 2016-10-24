
class WebinarLocation < PageObject

  @related_webinar_title = WebElement.new(:class => 'EventSquare-title')
  @related_webinar_date = WebElement.new(:class => 'EventSquare-date')
  @related_webinar_address = WebElement.new(:class => 'EventSquare-address')
  @related_webinar_calendar_image = WebElement.new(:class => 'Icon--add-to-calendar')
  @related_webinar_map_image = WebElement.new(:class => 'Icon--pin')

end

class WebinarDetailPage < PageObject
  include ShareModule
    @page_url = "#{$base_url}/#{FigNewton.webinar_detail_url}"

    @webinar_header_parent = WebElement.new(:class => 'Article-head')
    @webinar_article_title = WebElement.new('.Article-title',@webinar_header_parent)
    #@webinar_article_share_icon){webinar_header_parent_element.span_element(:class => 'Icon--share')}
    @webinar_article_share_icon = WebElement.new("a.Icon--share",@webinar_header_parent)
    @webinar_article_save_icon= WebElement.new(".saveTo",@webinar_header_parent)

    @article_image_parent = WebElement.new(:class => 'Article-image')
    @webinar_article_image = WebElement.new("img",@article_image_parent)
    @webinar_article_image_caption = WebElement.new('.Article-image-caption')
    @webinar_detail_text = WebElement.new("p",@article_image_parent)

    @related_webinar_parent = WebElement.new(:class => 'EventDetail-events')
    @related_webinar = WebElement.new('div.EventSquare')
    @related_webinar_date = WebElement.new('time.EventSquare-date')

    @webinar_locations = WebinarLocation.new('div.EventSquare')
    @watch_later_btn = WebElement.new(".ytp-watch-later-button")

    def validate_webinar_location_watch_button_for_past_webinar
      curr_date = (Time.now).strftime('%d %b %Y')
      @related_webinar_date.each do |related_webinar_date|
        elm = get_button_element(related_webinar_date.parent.parent.parent)
        if (Date.parse(related_webinar_date.text) < Date.parse(curr_date))

          expect(elm.text.include?('WATCH')).to be_truthy, "Expected : 'Watch' button for this event -- Actual #{elm.text}"
          break
        end
      end
    end

    def validate_webinar_location_subscribe_button_for_future_webinar
      curr_date = (Time.now).strftime('%d %b %Y')
      @related_webinar_date.each do |related_webinar_date|
        elm = get_button_element(related_webinar_date.parent.parent.parent)
        if (Date.parse(related_webinar_date.text) > Date.parse(curr_date))
          expect(elm.text.include?('SUBSCRIBE')).to be_truthy, "Expected : 'Subscribe' button for this event -- Actual #{elm.text}"
          break
        end
      end
    end

    def get_button_element(parent_element)
       parent_element.link_element(:class => 'Button')
    end

end