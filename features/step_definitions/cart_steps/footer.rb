And(/^The cart footer should be visible$/) do
  CartFooter.new.verify_visible
end

And(/^The cart footer should not be visible$/) do
  CartFooter.new.verify_not_visible
end

And(/^The arrow footer should be visible$/) do
  ArrowFooter.new.verify_visible
end

And(/^The arrow footer should not be visible$/) do
  ArrowFooter.new.verify_not_visible
end


