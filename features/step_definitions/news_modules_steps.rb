Then(/^I can see the "([^"]*)" "([^"]*)" module$/) do |mod_size, mod_type|
  case mod_size
    when 'two by two'
      @module_parent = Masonry.two_by_two
    when 'two by one'
      @module_parent = Masonry.two_by_one
    when 'one by one'
      @module_parent = Masonry.one_by_one
  end

  @module_parent.verify_visible

  case mod_type
    when 'video'
      NewsVideo.new.video.verify_visible
    when 'news'
      NewsVideo.new.news.verify_visible
  end
end