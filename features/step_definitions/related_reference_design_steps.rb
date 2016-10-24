Then(/^the Related Reference Design module will be visible$/) do
  RelatedReferenceDesign.title.verify_visible
  RelatedReferenceDesign.container.verify_visible
end

And(/^the Related Reference Design module will have title "([^"]*)"$/) do |arg|
  RelatedReferenceDesign.title.verify_text arg
end

And(/^the correct number of reference designs will be displayed for my device size$/) do
  count = 5
  if $size == "mobile"
    count = 1
  elsif $size == "phablet"
    count = 2
  elsif $size == "tablet"
    count = 3
  end
  RelatedReferenceDesign.tiles.where(:displayed, true).verify_count_less_than count+1
end


And(/^the related reference design has a title$/) do
  RelatedReferenceDesign.tiles.first.title.verify_visible
end

And(/^the related reference design has a manufacturer name$/) do
  RelatedReferenceDesign.tiles.first.manufacturer.verify_visible
end

And(/^the related reference design has a share button$/) do
  RelatedReferenceDesign.tiles.first.share_btn.verify_visible
end

And(/^the related reference design has a save to projects button$/) do
  RelatedReferenceDesign.tiles.first.save_btn.verify_visible
end

And(/^the related reference design has a date$/) do
  RelatedReferenceDesign.tiles.first.creation_date.verify_visible
end