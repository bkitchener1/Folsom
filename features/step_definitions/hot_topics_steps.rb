Then(/^I can see the first subsection$/) do
  ListBlock.new.list_block.verify_visible
end

And(/^I can see the heading for the first subsection$/) do
  ListBlock.list_block.list_block_section_heading.verify_visible
end