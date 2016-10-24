Then(/^I can see the Research And Events module$/) do
  ResearchAndEvents.new.container.verify_visible
end


And(/^the Research and Events module should have the correct title$/) do
  ResearchAndEvents.new.title.verify_text("RESEARCH")
  ResearchAndEvents.new.title.verify_text("EVENTS")
end

And(/^the Research and Events module should have a video visible$/) do
   ResearchAndEvents.new.video_tiles.verify_count_greater_than 0
end


And(/^the Research and Events module should have a news item$/) do
  ResearchAndEvents.new.news_tiles.verify_count_greater_than 0
end

And(/^the Research and Events module should have an event item$/) do
  ResearchAndEvents.new.event_tiles.verify_count_greater_than 0
end

And(/^each tile in the Research and Events module should load correctly$/) do
  ResearchAndEvents.new.tiles.each{|tile|
    tile.title.verify_visible
    tile.save_btn.verify_visible
    tile.share_btn.verify_visible
    tile.tags.verify_visible
  }
end

And(/^the Research and Events module should have at least "([^"]*)" item$/) do |arg|
  ResearchAndEvents.new.tiles.verify_count_greater_than 0
end