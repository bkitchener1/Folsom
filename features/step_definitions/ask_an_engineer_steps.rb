Then(/^I can see a Promo to Ask an Engineer a Question$/) do
  PromotionAd.new.promo_module.verify_visible
end

And(/^The Ask an Engineer a Question Promo has a Title$/) do
  PromotionAd.new.promo_header.verify_visible
end

And(/^The Ask an Engineer a Question Promo has information text$/) do
  PromotionAd.promo_text.verify_visible
end

And(/^The Ask an Engineer a Question Promo has a Video Chat Button$/) do
  PromotionAd.new.promo_btn.verify_visible
end