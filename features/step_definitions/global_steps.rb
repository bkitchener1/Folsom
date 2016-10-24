Then(/^The Page Loads without any exceptions$/) do
  ArrowBase.new.verify_page_integrity
end