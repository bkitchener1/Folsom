# update for message at 2000

Then(/^I am prompted to Refine My Search$/) do
  #Paging.new.refine_search_after_400.verify_visible
  Paging.new.refine_search_message.verify_visible
end

And(/^It displays with a helpful message$/) do
  Paging.new.refine_search_message.verify_text 'Filter Your Search For Better Results'
end
